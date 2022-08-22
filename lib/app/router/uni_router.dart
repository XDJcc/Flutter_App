// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:study_flutter/app/router/unit_router_utils.dart';
import 'package:study_flutter/app/views/demo/demo_list_page.dart';
import 'package:study_flutter/app/views/demo/nested_scroll_view_demo/NestedScrollViewDemoPage.dart';
import 'package:study_flutter/app/views/navgation/xdj_navigation.dart';
import 'package:study_flutter/home_page/pages/home.dart';
import 'package:study_flutter/splash_page/pages/splash_page.dart';

class UnitRouter {
  static const String nav = '/nav';
  static const String search = '/search';
  static const String home = '/home';
  static const String demo_list = '/demo_list';

  static const String nested_scroll_view_demo = '/nested_scroll_view_demo';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case nav:
        return Left2RightRouter(child: const NavgationPage());
      case home:
        return Left2RightRouter(child: const HomePage());

      ///demo_list
      case demo_list:
        return Left2RightRouter(child: const DemoListPage());
        
      case nested_scroll_view_demo:
        return Left2RightRouter(child: const NestedScrollViewDemoPage());


      ///界面不存在
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
