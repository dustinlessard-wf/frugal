// Autogenerated by Frugal Compiler (1.12.0)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING

library event.src.f_foo_structs;import 'dart:typed_data' show Uint8List;
import 'package:thrift/thrift.dart';
import 'package:event/event.dart' as t_event;
import 'package:base/base.dart' as t_base;

class ping_args implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ping_args");



  ping_args() {
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while(true) {
      field = iprot.readFieldBegin();
      if(field.type == TType.STOP) {
        break;
      }
      switch(field.id) {
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ping_args(");

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
class ping_result implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ping_result");



  ping_result() {
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while(true) {
      field = iprot.readFieldBegin();
      if(field.type == TType.STOP) {
        break;
      }
      switch(field.id) {
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ping_result(");

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
class blah_args implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("blah_args");
  static final TField _NUM_FIELD_DESC = new TField("num", TType.I32, 1);
  static final TField _STR_FIELD_DESC = new TField("Str", TType.STRING, 2);
  static final TField _EVENT_FIELD_DESC = new TField("event", TType.STRUCT, 3);

  int _num;
  static const int NUM = 1;
  String _str;
  static const int STR = 2;
  t_event.Event _event;
  static const int EVENT = 3;

  bool __isset_num = false;

  blah_args() {
  }

  int get num => this._num;

  set num(int num) {
    this._num = num;
    this.__isset_num = true;
  }

  bool isSetNum() => this.__isset_num;

  unsetNum() {
    this.__isset_num = false;
  }

  String get str => this._str;

  set str(String str) {
    this._str = str;
  }

  bool isSetStr() => this.str != null;

  unsetStr() {
    this.str = null;
  }

  t_event.Event get event => this._event;

  set event(t_event.Event event) {
    this._event = event;
  }

  bool isSetEvent() => this.event != null;

  unsetEvent() {
    this.event = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case NUM:
        return this.num;
      case STR:
        return this.str;
      case EVENT:
        return this.event;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      case NUM:
        if(value == null) {
          unsetNum();
        } else {
          this.num = value;
        }
        break;

      case STR:
        if(value == null) {
          unsetStr();
        } else {
          this.str = value;
        }
        break;

      case EVENT:
        if(value == null) {
          unsetEvent();
        } else {
          this.event = value;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      case NUM:
        return isSetNum();
      case STR:
        return isSetStr();
      case EVENT:
        return isSetEvent();
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while(true) {
      field = iprot.readFieldBegin();
      if(field.type == TType.STOP) {
        break;
      }
      switch(field.id) {
        case NUM:
          if(field.type == TType.I32) {
            num = iprot.readI32();
            this.__isset_num = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case STR:
          if(field.type == TType.STRING) {
            str = iprot.readString();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EVENT:
          if(field.type == TType.STRUCT) {
            event = new t_event.Event();
            event.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldBegin(_NUM_FIELD_DESC);
    oprot.writeI32(num);
    oprot.writeFieldEnd();
    if(this.str != null) {
      oprot.writeFieldBegin(_STR_FIELD_DESC);
      oprot.writeString(str);
      oprot.writeFieldEnd();
    }
    if(this.event != null) {
      oprot.writeFieldBegin(_EVENT_FIELD_DESC);
      event.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("blah_args(");

    ret.write("num:");
    ret.write(this.num);

    ret.write(", ");
    ret.write("str:");
    if(this.str == null) {
      ret.write("null");
    } else {
      ret.write(this.str);
    }

    ret.write(", ");
    ret.write("event:");
    if(this.event == null) {
      ret.write("null");
    } else {
      ret.write(this.event);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
class blah_result implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("blah_result");
  static final TField _SUCCESS_FIELD_DESC = new TField("success", TType.I64, 0);
  static final TField _AWE_FIELD_DESC = new TField("awe", TType.STRUCT, 1);
  static final TField _API_FIELD_DESC = new TField("api", TType.STRUCT, 2);

  int _success;
  static const int SUCCESS = 0;
  t_event.AwesomeException _awe;
  static const int AWE = 1;
  t_base.api_exception _api;
  static const int API = 2;

  bool __isset_success = false;

  blah_result() {
  }

  int get success => this._success;

  set success(int success) {
    this._success = success;
    this.__isset_success = true;
  }

  bool isSetSuccess() => this.__isset_success;

  unsetSuccess() {
    this.__isset_success = false;
  }

  t_event.AwesomeException get awe => this._awe;

  set awe(t_event.AwesomeException awe) {
    this._awe = awe;
  }

  bool isSetAwe() => this.awe != null;

  unsetAwe() {
    this.awe = null;
  }

  t_base.api_exception get api => this._api;

  set api(t_base.api_exception api) {
    this._api = api;
  }

  bool isSetApi() => this.api != null;

  unsetApi() {
    this.api = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SUCCESS:
        return this.success;
      case AWE:
        return this.awe;
      case API:
        return this.api;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      case SUCCESS:
        if(value == null) {
          unsetSuccess();
        } else {
          this.success = value;
        }
        break;

      case AWE:
        if(value == null) {
          unsetAwe();
        } else {
          this.awe = value;
        }
        break;

      case API:
        if(value == null) {
          unsetApi();
        } else {
          this.api = value;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      case SUCCESS:
        return isSetSuccess();
      case AWE:
        return isSetAwe();
      case API:
        return isSetApi();
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while(true) {
      field = iprot.readFieldBegin();
      if(field.type == TType.STOP) {
        break;
      }
      switch(field.id) {
        case SUCCESS:
          if(field.type == TType.I64) {
            success = iprot.readI64();
            this.__isset_success = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case AWE:
          if(field.type == TType.STRUCT) {
            awe = new t_event.AwesomeException();
            awe.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case API:
          if(field.type == TType.STRUCT) {
            api = new t_base.api_exception();
            api.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    if(isSetSuccess()) {
      oprot.writeFieldBegin(_SUCCESS_FIELD_DESC);
      oprot.writeI64(success);
      oprot.writeFieldEnd();
    }
    if(isSetAwe() && this.awe != null) {
      oprot.writeFieldBegin(_AWE_FIELD_DESC);
      awe.write(oprot);
      oprot.writeFieldEnd();
    }
    if(isSetApi() && this.api != null) {
      oprot.writeFieldBegin(_API_FIELD_DESC);
      api.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("blah_result(");

    if(isSetSuccess()) {
      ret.write("success:");
      ret.write(this.success);
    }

    if(isSetAwe()) {
      ret.write(", ");
      ret.write("awe:");
      if(this.awe == null) {
        ret.write("null");
      } else {
        ret.write(this.awe);
      }
    }

    if(isSetApi()) {
      ret.write(", ");
      ret.write("api:");
      if(this.api == null) {
        ret.write("null");
      } else {
        ret.write(this.api);
      }
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
class oneWay_args implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("oneWay_args");
  static final TField _ID_FIELD_DESC = new TField("id", TType.I64, 1);
  static final TField _REQ_FIELD_DESC = new TField("req", TType.MAP, 2);

  int _id;
  static const int ID = 1;
  Map<int, String> _req;
  static const int REQ = 2;

  bool __isset_id = false;

  oneWay_args() {
  }

  int get id => this._id;

  set id(int id) {
    this._id = id;
    this.__isset_id = true;
  }

  bool isSetId() => this.__isset_id;

  unsetId() {
    this.__isset_id = false;
  }

  Map<int, String> get req => this._req;

  set req(Map<int, String> req) {
    this._req = req;
  }

  bool isSetReq() => this.req != null;

  unsetReq() {
    this.req = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ID:
        return this.id;
      case REQ:
        return this.req;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch(fieldID) {
      case ID:
        if(value == null) {
          unsetId();
        } else {
          this.id = value;
        }
        break;

      case REQ:
        if(value == null) {
          unsetReq();
        } else {
          this.req = value;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if the field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch(fieldID) {
      case ID:
        return isSetId();
      case REQ:
        return isSetReq();
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while(true) {
      field = iprot.readFieldBegin();
      if(field.type == TType.STOP) {
        break;
      }
      switch(field.id) {
        case ID:
          if(field.type == TType.I64) {
            id = iprot.readI64();
            this.__isset_id = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case REQ:
          if(field.type == TType.MAP) {
            TMap elem0 = iprot.readMapBegin();
            req = new Map<int, String>();
            for(int elem2 = 0; elem2 < elem0.length; ++elem2) {
              int elem3 = iprot.readI32();
              String elem1 = iprot.readString();
              req[elem3] = elem1;
            }
            iprot.readMapEnd();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldBegin(_ID_FIELD_DESC);
    oprot.writeI64(id);
    oprot.writeFieldEnd();
    if(this.req != null) {
      oprot.writeFieldBegin(_REQ_FIELD_DESC);
      oprot.writeMapBegin(new TMap(TType.I32, TType.STRING, req.length));
      for(var elem4 in req.keys) {
        oprot.writeI32(elem4);
        oprot.writeString(req[elem4]);
      }
      oprot.writeMapEnd();
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("oneWay_args(");

    ret.write("id:");
    ret.write(this.id);

    ret.write(", ");
    ret.write("req:");
    if(this.req == null) {
      ret.write("null");
    } else {
      ret.write(this.req);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
