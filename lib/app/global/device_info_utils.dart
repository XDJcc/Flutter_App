import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

///设备信息
abstract class DeviceInfoUtils {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  static late BaseDeviceInfo _deviceInfo;

  ///使用之前必须初始化设备信息
  static Future<void> initDeviceInfo() async {
    if (Platform.isAndroid) {
      _deviceInfo = await _deviceInfoPlugin.androidInfo;
    } else if (Platform.isIOS) {
      _deviceInfo = await _deviceInfoPlugin.iosInfo;
    }
  }

  /// 将设备信息以Map的形式返回
  static Map<String, dynamic> get infoMap => _deviceInfo.toMap();

  ///当前设备是否是Android
  static bool get isAndroid => Platform.isAndroid;

  ///当前设备是否是iOS
  static bool get isIOS => Platform.isIOS;

  ///获取设备信息
  static T deviceInfo<T extends BaseDeviceInfo>() {
    return _deviceInfo as T;
  }

  ///获取Android设备信息
  static AndroidDeviceInfo get androidInfo {
    if (Platform.isAndroid) {
      return _deviceInfo as AndroidDeviceInfo;
    } else {
      throw Exception("当前设备不是安卓设备");
    }
  }

  ///获取iOS设备信息
  static IosDeviceInfo get iosInfo {
    if (Platform.isAndroid) {
      return _deviceInfo as IosDeviceInfo;
    } else {
      throw Exception("当前设备不是iOS设备");
    }
  }

  static AppDeviceInfo? get infoModel {
    if (isIOS) {
      return AppDeviceInfo(
          brand: iosInfo.name ?? '',
          systemVersion: iosInfo.systemVersion ?? '',
          platform: iosInfo.systemVersion ?? '',
          isPhysicalDevice: iosInfo.isPhysicalDevice,
          uuid: iosInfo.identifierForVendor ?? '',
          incremental: iosInfo.systemVersion ?? '');
    } else if (isAndroid) {
      return AppDeviceInfo(
          brand: '${androidInfo.brand} ${androidInfo.model}',
          systemVersion: androidInfo.version.release ?? '',
          platform: 'Android',
          isPhysicalDevice: androidInfo.isPhysicalDevice ?? false,
          uuid: androidInfo.androidId ?? '',
          incremental: androidInfo.version.incremental ?? '');
    }
    return null;
  }

  static Map<String, dynamic> get appInfoMap {
    return infoModel?.toJson ?? {};
  }
}

class AppDeviceInfo {
  final String brand;
  final String systemVersion;
  final String platform;
  final bool isPhysicalDevice;
  final String uuid;
  final String incremental;

  const AppDeviceInfo(
      {required this.brand,
        required this.systemVersion,
        required this.platform,
        required this.isPhysicalDevice,
        required this.uuid,
        required this.incremental});

  Map<String, dynamic> get toJson {
    return {
      'brand': brand,
      'systemVersion': systemVersion,
      'platform': platform,
      'isPhysicalDevice': isPhysicalDevice,
      'uuid': uuid,
      'incremental': incremental
    };
  }
}
