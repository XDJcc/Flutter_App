// ignore_for_file: constant_identifier_names


import 'package:flutter/material.dart';
import 'package:study_flutter/app/router/unit_router_utils.dart';
import 'package:study_flutter/app/views/navgation/xdj_navigation.dart';
import 'package:study_flutter/home_page/pages/home.dart';
import 'package:study_flutter/splash_page/pages/splash_page.dart';

class UnitRouter {
  static const String nav = '/nav';
  static const String search = '/search';
  static const String home = '/home';




  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case nav:
        return Left2RightRouter(child:const NavgationPage());
      case home:
        return Left2RightRouter(child:const HomePage());

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
