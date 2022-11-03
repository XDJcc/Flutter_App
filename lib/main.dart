/// create by XDJcc 2022-8-19
/// contact me by email 2045659302@qq.com
///说明：入口文件

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/global/app_init_utils.dart';
import 'package:flutter_app/app/global/global.dart';
import 'package:flutter_app/app/global/lifecycle_event_handler.dart';
import 'package:flutter_app/navgation/flutter_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //滚动性能优化 1.22.0
  GestureBinding.instance.resamplingEnabled = true;

  //监听App生命周期回调
  WidgetsBinding.instance.addObserver(LifecycleEventHandler(
      resumeCallBack: () async {}, suspendingCallBack: () async {}));

  //初始化项目数据
  await AppInitUtils.initApp();

  // 初始化获取相机列表
  GlobalData.cameras = await availableCameras();

  runApp(const FlutterXdj());

  //设置Android头部的导航栏透明
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
  }
}
