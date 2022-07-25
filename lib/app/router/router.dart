import 'package:study_flutter/home_page/pages/index.dart';
import 'package:study_flutter/splash_page/pages/splash_page.dart';

/* 
    路由表
 */
final Map<String, Function> routes = {
  '/': (context, {arguments}) => const Home(),
  '/splash': (context, {arguments}) =>const SplashPage(),
};
