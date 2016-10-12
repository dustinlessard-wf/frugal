import 'dart:convert' show BASE64;
import 'dart:convert' show Utf8Codec;
import 'dart:typed_data' show Uint8List;

import 'package:frugal/frugal.dart';
import 'package:test/test.dart';
import 'package:thrift/thrift.dart';
import 'package:w_transport/w_transport.dart';
import 'package:w_transport/w_transport_mock.dart';
import 'f_transport_test.dart' show MockFRegistry;

void main() {
  configureWTransportForTest();
  const utf8Codec = const Utf8Codec();

  group('FHttpClientTransport', () {
    Client client;
    FHttpConfig config;
    MockFRegistry registry;
    FHttpTransport transport;

    Map expectedRequestHeaders = {
      'x-frugal-payload-limit': '10',
      // TODO: When w_transport supports content-type overrides, enable this.
      // 'content-type': 'application/x-frugal',
      'content-transfer-encoding': 'base64',
      'accept': 'application/x-frugal',
      'foo': 'bar'
    };
    Map responseHeaders = {
      'content-type': 'application/x-frugal',
      'content-transfer-encoding': 'base64'
    };
    Uint8List transportRequest =
        new Uint8List.fromList([0, 0, 0, 5, 1, 2, 3, 4, 5]);
    String transportRequestB64 = BASE64.encode(transportRequest);
    Uint8List transportResponse = new Uint8List.fromList([6, 7, 8, 9]);
    Uint8List transportResponseFramed =
        new Uint8List.fromList([0, 0, 0, 4, 6, 7, 8, 9]);
    String transportResponseB64 = BASE64.encode(transportResponseFramed);

    setUp(() {
      client = new Client();
      config = new FHttpConfig(Uri.parse('http://localhost'), {'foo': 'bar'},
          responseSizeLimit: 10);
      registry = new MockFRegistry();
      transport = new FHttpTransport(client, config, registry: registry);
    });

    test('Test transport sends body and receives response', () async {
      MockTransports.http.when(config.uri, (FinalizedRequest request) async {
        if (request.method == 'POST') {
          HttpBody body = request.body as HttpBody;
          if (body == null || body.asString() != transportRequestB64)
            return new MockResponse.badRequest();
          expectedRequestHeaders.forEach((K, V) {
            if (request.headers[K] != V) {
              return new MockResponse.badRequest();
            }
          });
          return new MockResponse.ok(
              body: transportResponseB64, headers: responseHeaders);
        } else {
          return new MockResponse.badRequest();
        }
      });

      await transport.send(transportRequest);
      expect(registry.data[0], transportResponse);
    });

    test('Multiple writes are not coalesced', () async {
      MockTransports.http.when(config.uri, (FinalizedRequest request) async {
        if (request.method == 'POST') {
          HttpBody body = request.body as HttpBody;
          if (body == null || body.asString() != transportRequestB64)
            return new MockResponse.badRequest();
          expectedRequestHeaders.forEach((K, V) {
            if (request.headers[K] != V) {
              return new MockResponse.badRequest();
            }
          });
          return new MockResponse.ok(
              body: transportResponseB64, headers: responseHeaders);
        } else {
          return new MockResponse.badRequest();
        }
      });

      var first = transport.send(transportRequest);
      var second = transport.send(transportRequest);

      await first;
      await second;

      expect(registry.data[0], transportResponse);
      expect(registry.data[1], transportResponse);
    });

    test('Test transport does not execute frame on oneway requests', () async {
      Uint8List responseBytes = new Uint8List.fromList([0, 0, 0, 0]);
      Response response =
          new MockResponse.ok(body: BASE64.encode(responseBytes));
      MockTransports.http.expect('POST', config.uri, respondWith: response);
      await transport.send(transportRequest);
      expect(registry.data.length, 0);
    });

    test('Test transport throws TransportError on bad oneway requests',
        () async {
      Uint8List responseBytes = new Uint8List.fromList([0, 0, 0, 1]);
      Response response =
          new MockResponse.ok(body: BASE64.encode(responseBytes));
      MockTransports.http.expect('POST', config.uri, respondWith: response);
      expect(transport.send(transportRequest),
          throwsA(new isInstanceOf<TTransportError>()));
    });

    test('Test transport receives non-base64 payload', () async {
      Response response = new MockResponse.ok(body: '`');
      MockTransports.http.expect('POST', config.uri, respondWith: response);
      expect(transport.send(transportRequest),
          throwsA(new isInstanceOf<TProtocolError>()));
    });

    test('Test transport receives unframed frugal payload', () async {
      Response response = new MockResponse.ok();
      MockTransports.http.expect('POST', config.uri, respondWith: response);
      expect(transport.send(transportRequest),
          throwsA(new isInstanceOf<TProtocolError>()));
    });
  });

  group('FHttpClientTransport request size too large', () {
    Client client;
    MockFRegistry registry;
    FHttpTransport transport;

    setUp(() {
      client = new Client();
      var config = new FHttpConfig(Uri.parse('http://localhost'), {},
          requestSizeLimit: 10);
      registry = new MockFRegistry();
      transport = new FHttpTransport(client, config, registry: registry);
    });

    test('Test transport receives error', () {
      expect(transport.send(utf8Codec.encode('my really long request')),
          throwsA(new isInstanceOf<FMessageSizeError>()));
    });
  });

  group('FHttpClientTransport http post failed', () {
    FHttpConfig config;
    MockFRegistry registry;
    FHttpTransport transport;

    setUp(() {
      config = new FHttpConfig(Uri.parse('http://localhost'), {});
      registry = new MockFRegistry();
      transport = new FHttpTransport(new Client(), config, registry: registry);
    });

    test('Test transport receives error on 401 response', () async {
      Response response = new MockResponse.unauthorized();
      MockTransports.http.expect('POST', config.uri, respondWith: response);
      expect(transport.send(utf8Codec.encode('my request')),
          throwsA(new isInstanceOf<TTransportError>()));
    });

    test('Test transport receives response too large error on 413 response',
        () async {
      Response response =
          new MockResponse(FHttpTransport.REQUEST_ENTITY_TOO_LARGE);
      MockTransports.http.expect('POST', config.uri, respondWith: response);
      expect(transport.send(utf8Codec.encode('my request')),
          throwsA(new isInstanceOf<FMessageSizeError>()));
    });

    test('Test transport receives error on 404 response', () async {
      Response response = new MockResponse.badRequest();
      MockTransports.http.expect('POST', config.uri, respondWith: response);
      expect(transport.send(utf8Codec.encode('my request')),
          throwsA(new isInstanceOf<TTransportError>()));
    });

    test('Test transport receives error on no response', () async {
      Response response = new MockResponse.badRequest();
      MockTransports.http.expect('POST', config.uri, respondWith: response);
      expect(transport.send(utf8Codec.encode('my request')),
          throwsA(new isInstanceOf<TTransportError>()));
    });
  });

  group('FHttpConfig null uri', () {
    test('Test initialization throws error', () {
      expect(() => new FHttpConfig(null, {}),
          throwsA(new isInstanceOf<ArgumentError>()));
    });
  });
}
