import 'package:flutter_app/app/global/device_info_utils.dart';
import 'package:flutter_app/app/global/global.dart';
import 'package:flutter_app/app/global/package_utils.dart';
import 'package:flutter_app/app/global/sp_utils.dart';
import 'package:flutter_app/app/netWork/network_utils.dart';
import 'package:flutter_app/app/utils/utils.dart';

abstract class AppInitUtils {
  static initApp() async {
    // 初始化本地存储
    await SPUtils.initSP();
    // //设备信息
    await DeviceInfoUtils.initDeviceInfo();
    // //包信息
    await PackageUtils.initPackageInfo();
    //网络请求
    await NetworkUtils.initNetwork();
  }

  static _initCustomConfig() async {
    GlobalData.deviceInfo = await Util.deviceInfo;
    // GlobalData.ipAddress = await Util.printIps;
  }
}
