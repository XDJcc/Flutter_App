
/// create by XDJcc 2022-8-19
/// contact me by email 2045659302@qq.com
///说明：入口文件

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_flutter/app/global/global.dart';
import 'package:study_flutter/app/views/navgation/flutter_xdj.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //滚动性能优化 1.22.0
  GestureBinding.instance.resamplingEnabled = true;

/* 初始化获取相机列表 */
  GlobalData.cameras = await availableCameras();

  runApp(const FlutterXdj());

  //设置Android头部的导航栏透明
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
  }
}
