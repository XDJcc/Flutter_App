import 'package:flutter_app/home_page/home.dart';
import 'package:flutter_app/splash_page/pages/splash_page.dart';

/* 
    路由表
 */
final Map<String, Function> routes = {
  '/': (context, {arguments}) => const HomePage(),
  '/splash': (context, {arguments}) => const SplashPage(),
};
