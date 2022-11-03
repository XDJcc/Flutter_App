// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_app/app/router/unit_router_utils.dart';
import 'package:flutter_app/app/views/demo/demo_list_page.dart';
import 'package:flutter_app/home_page/pages/home.dart';
import 'package:flutter_app/navgation/xdj_navigation.dart';

import '../../login_page/login_page.dart';
import '../views/demo/look_for_flavor_page/look_for_flavor_page.dart';
import '../views/demo/nested_scroll_view_demo/NestedScrollViewDemoPage.dart';
import '../views/demo/nested_scroll_view_slivers_demo/nested_scroll_view_slivers_demo.dart';
import '../views/demo/sliver_persistent_header_demo_page/sliver_persistent_header_demo_page.dart';

class UnitRouter {
  static const String nav = '/nav';
  static const String search = '/search';
  static const String home = '/home';
  static const String demo_list = '/demo_list';
  static const String nested_scroll_view_demo = '/nested_scroll_view_demo';
  static const String sliver_persistent_header_demo_page =
      '/sliver_persistent_header_demo_page';
  static const String look_for_flavor_page = '/look_for_flavor_page';
  static const String nested_slivers = '/nested_slivers';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case nav:
        return Right2LeftRouter(child: const NavgationPage());

      case home:
        return Right2LeftRouter(child: const HomePage());

      ///demo_list
      case demo_list:
        return Right2LeftRouter(child: const DemoListPage());

      case nested_scroll_view_demo:
        return Right2LeftRouter(child: const NestedScrollViewDemoPage());

      case sliver_persistent_header_demo_page:
        return Right2LeftRouter(child: const SliverPersistentHeaderDemoPage());

      case look_for_flavor_page:
        return Right2LeftRouter(child: const LookForFlavorPage());

      case nested_slivers:
        return Right2LeftRouter(child: const NestedSliversPage());

      case login:
        return Right2LeftRouter(child: const LoginPage());

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
