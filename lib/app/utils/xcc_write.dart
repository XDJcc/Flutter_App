import 'dart:convert';
import 'dart:developer';

class XccLog {
  static write(dynamic val) {
    log('xcc write -->  ${json.encode(val)}');
  }
}
