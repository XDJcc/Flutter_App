//命名路由传参的固定写法

import 'package:flutter/material.dart';
import 'package:study_flutter/app/router/XDJ/route_utils.dart';
import 'package:study_flutter/app/router/XDJ/router.dart';

///
/// 路由拦截器
///
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = Right2LeftRouter(
          child: Builder(
              builder: ((context) =>
                  pageContentBuilder(context, arguments: settings.arguments))));
      //final Route route =
      //     MaterialPageRoute(builder: (context) =>
      //     pageContentBuilder(context, arguments: settings.arguments)));
      return route;
    } else {
      final Route route = Right2LeftRouter(
          child: Builder(builder: ((context) => pageContentBuilder(context))));
      // final Route route =
      //     MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
