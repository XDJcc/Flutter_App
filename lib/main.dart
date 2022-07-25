import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_flutter/app/global/global.dart';
import 'package:study_flutter/app/router/index.dart';
import 'package:study_flutter/app/utils/themeData.dart';
import 'package:study_flutter/splash_page/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

/* 初始化获取相机列表 */
  GlobalData.cameras = await availableCameras();

  runApp(const MyApp());

  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //全局设置透明
        statusBarIconBrightness: Brightness.dark
        //light:黑色图标 dark：白色图标
        //在此处设置statusBarIconBrightness为全局设置
        ));
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'XDJ',
          navigatorKey: navigatorKey, //
          initialRoute: '/splash',   //初始化route
          onGenerateRoute: onGenerateRoute, //监听 routes
          builder: (context, child) {
            child = BotToastInit()(context, child); //初始化toast
            return child;
          },
          theme: ThemeData(
            primarySwatch: Colors.teal,
            textTheme: Typography.englishLike2018.apply(
                fontSizeFactor: 1.sp, bodyColor: ThemeColor.textBodyColor),
          ),
          home: child,
        );
      },
      // child: const SplashPage({'name': 'zhangsan'}),
    );
  }
}
