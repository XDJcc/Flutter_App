import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

typedef SPKeyValueCallBack = void Function(String key, Object? value);

abstract class SPUtils {
  static late SharedPreferences _preferences;

  static SharedPreferences get spInstance => _preferences;

  ///必须在使用之前调用
  static Future<void> initSP() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// 判断是否存在key的数据
  static bool hasKey(String? key) {
    if (key == null || key.isEmpty) {
      return false;
    }
    return _preferences.getKeys().contains(key);
  }

  /// 存储object类型数据
  static Future<bool> putObject(String? key, Object? value) async {
    if (key == null || key.isEmpty || value == null) {
      return false;
    }
    return await _preferences.setString(key, json.encode(value));
  }

  /// 获取sp中key的map数据
  static Map getObject(String? key, {Map defValue = const {}}) {
    if (key == null || key.isEmpty) {
      return defValue;
    }
    String? _data = _preferences.getString(key);
    return (_data == null || _data.isEmpty) ? defValue : json.decode(_data);
  }

  /// 存储sp中key的list集合
  static Future<bool> putObjectList(String? key, List<Object>? list) async {
    if (key == null || key.isEmpty || list == null) {
      return false;
    }
    List<String> _dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return await _preferences.setStringList(key, _dataList);
  }

  /// 获取sp中key的list集合
  static List<Map> getObjectList(String? key, {List<Map> defValue = const []}) {
    if (key == null || key.isEmpty) {
      return defValue;
    }
    List<String>? dataList = _preferences.getStringList(key);
    return dataList?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    }).toList() ??
        defValue;
  }

  /// 存储sp中key的字符串
  static Future<bool> putString(String? key, String? value) async {
    if (key == null || key.isEmpty || value == null) {
      return false;
    }
    return await _preferences.setString(key, value);
  }

  /// 获取sp中key的字符串
  static String getString(String? key, {String defValue = ""}) {
    if (key == null || key.isEmpty) {
      return defValue;
    }
    return _preferences.getString(key) ?? defValue;
  }

  /// 存储sp中key的布尔值
  static Future<bool> putBool(String? key, bool? value) async {
    if (key == null || key.isEmpty || value == null) {
      return false;
    }
    return await _preferences.setBool(key, value);
  }

  /// 获取sp中key的布尔值
  static bool getBool(String? key, {bool defValue = false}) {
    if (key == null || key.isEmpty) {
      return defValue;
    }
    return _preferences.getBool(key) ?? defValue;
  }

  /// 存储sp中key的int值
  static Future<bool> putInt(String? key, int? value) async {
    if (key == null || key.isEmpty || value == null) {
      return false;
    }
    return await _preferences.setInt(key, value);
  }

  /// 获取sp中key的int值
  static int getInt(String? key, {int defValue = 0}) {
    if (key == null || key.isEmpty) {
      return defValue;
    }
    return _preferences.getInt(key) ?? defValue;
  }

  /// 存储sp中key的double值
  static Future<bool> putDouble(String? key, double? value) async {
    if (key == null || key.isEmpty || value == null) {
      return false;
    }
    return await _preferences.setDouble(key, value);
  }

  /// 获取sp中key的double值
  static double getDouble(String? key, {double defValue = 0.0}) {
    if (key == null || key.isEmpty) {
      return defValue;
    }
    return _preferences.getDouble(key) ?? defValue;
  }

  /// put string list.
  /// 存储sp中key的list<String>值
  static Future<bool> putStringList(String? key, List<String>? value) async {
    if (key == null || key.isEmpty || value == null) {
      return false;
    }
    return await _preferences.setStringList(key, value);
  }

  /// 获取sp中key的list<String>值
  static List<String> getStringList(String? key,
      {List<String> defValue = const []}) {
    if (key == null || key.isEmpty) {
      return defValue;
    }
    return _preferences.getStringList(key) ?? defValue;
  }

  /// 存储sp中key的map值
  static Future<bool> putStringMap(String? key, Map? value) async {
    if (key == null || key.isEmpty || value == null) {
      return false;
    }
    String jsonMapString = jsonEncode(value);
    return await _preferences.setString(key, jsonMapString);
  }

  /// 获取sp中key的map值
  static Map getStringMap(String? key, {Map defValue = const {}}) {
    if (key == null || key.isEmpty) {
      return defValue;
    }
    String? jsonString = _preferences.getString(key);
    if (jsonString == null) {
      return defValue;
    }
    return json.decode(jsonString);
  }

  /// 移除sp中key的值
  static Future<bool> remove(String? key) async {
    if (key == null || key.isEmpty) {
      return false;
    }
    return await _preferences.remove(key);
  }

  /// 清除sp
  static Future<bool> clear() {
    return _preferences.clear();
  }

  /// 遍历sp
  static void forEach(SPKeyValueCallBack callBack) {
    Set<String> keys = _preferences.getKeys();
    Iterator<String> iterator = keys.iterator;
    while (iterator.moveNext()) {
      var key = iterator.current;
      Object? value = _preferences.get(key);
      callBack(key, value);
    }
  }

  ///获取存储的所有值
  static Map<String, dynamic> get allKayValueMap {
    Map<String, dynamic> map = {};
    Set<String> keys = _preferences.getKeys();
    Iterator<String> iterator = keys.iterator;
    while (iterator.moveNext()) {
      String key = iterator.current;
      Object? value = _preferences.get(key);
      map[key] = value;
    }
    return map;
  }
}
