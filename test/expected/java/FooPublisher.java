/**
 * Autogenerated by Frugal Compiler (0.0.1)
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

package foo;

import com.workiva.frugal.Provider;
import com.workiva.frugal.Transport;
import com.workiva.frugal.TransportFactory;
import com.workiva.frugal.Subscription;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.*;
import org.apache.thrift.TApplicationException;

import org.apache.thrift.transport.TTransportException;

import org.apache.thrift.transport.TTransportFactory;

import javax.annotation.Generated;



/**
 * And this is a scope docstring.
 */
@Generated(value = "Autogenerated by Frugal Compiler (0.0.1)", date = "2015-10-5")
public class FooPublisher {

	private static final String delimiter = ".";

	private Transport transport;
	private TProtocol protocol;
	private int seqId;

	public FooPublisher(Provider provider) {
		Provider.Client client = provider.build();
		transport = client.getTransport();
		protocol = client.getProtocol();
	}

	public void publishBar(String baz, Stuff req) throws TException {
		String op = "Bar";
		String prefix = String.format("foo.bar.%s.qux.", baz);
		String topic = String.format("%sFoo%s%s", prefix, delimiter, op);
		transport.preparePublish(topic);
		seqId++;
		protocol.writeMessageBegin(new TMessage(op, TMessageType.CALL, seqId));
		req.write(protocol);
		protocol.writeMessageEnd();
		transport.flush();
	}


	/**
	 * This is an operation docstring.
	 */
	public void publishFoo(String baz, Thing req) throws TException {
		String op = "Foo";
		String prefix = String.format("foo.bar.%s.qux.", baz);
		String topic = String.format("%sFoo%s%s", prefix, delimiter, op);
		transport.preparePublish(topic);
		seqId++;
		protocol.writeMessageBegin(new TMessage(op, TMessageType.CALL, seqId));
		req.write(protocol);
		protocol.writeMessageEnd();
		transport.flush();
	}
}