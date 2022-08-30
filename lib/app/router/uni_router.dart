// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:study_flutter/app/router/unit_router_utils.dart';
import 'package:study_flutter/app/views/demo/demo_list_page.dart';
import 'package:study_flutter/app/views/look_for_flavor_page/look_for_flavor_page.dart';
import 'package:study_flutter/app/views/navgation/xdj_navigation.dart';
import 'package:study_flutter/app/views/nested_scroll_view_demo/NestedScrollViewDemoPage.dart';
import 'package:study_flutter/app/views/sliver_persistent_header_demo_page/sliver_persistent_header_demo_page.dart';
import 'package:study_flutter/home_page/pages/home.dart';
import 'package:study_flutter/splash_page/pages/splash_page.dart';

class UnitRouter {
  static const String nav = '/nav';
  static const String search = '/search';
  static const String home = '/home';
  static const String demo_list = '/demo_list';
  static const String nested_scroll_view_demo = '/nested_scroll_view_demo';
  static const String sliver_persistent_header_demo_page = '/sliver_persistent_header_demo_page';
  static const String look_for_flavor_page = '/look_for_flavor_page';

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
