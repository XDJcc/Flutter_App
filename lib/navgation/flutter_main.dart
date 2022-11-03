/// create by XDJcc 2022-8-19
/// contact me by email 2045659302@qq.com
///说明：主程序

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/app/router/uni_router.dart';
import 'package:flutter_app/app/utils/themeData.dart';
import 'package:flutter_app/splash_page/pages/splash_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class FlutterXdj extends StatelessWidget {
  const FlutterXdj({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'XDJ',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey, //
          // theme: ThemeData(fontFamily: 'pingfang'),
          theme: MeThemeData,
          onGenerateRoute: UnitRouter.generateRoute, //监听 routes
          builder: (context, child) {
            child = BotToastInit()(context, child); //初始化toast
            return child;
          },
          home: child,
        );
      },
      child: const SplashPage(),
    );
  }
}
