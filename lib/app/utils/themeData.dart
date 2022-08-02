import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 全局主题颜色配置 */
class ThemeColor {
  /* 元青 */
  static Color textBodyColor = const Color(0xff3e3c3d);
  /* 蒂芙尼蓝 */
  static Color dfnBlue = const Color(0xff81d8d0);
  /* 纯白 */
  static Color pureWhite = const Color(0xfff5f2e9);
  /* 暗夜蓝 */
  static Color ayBlue = const Color(0xff0c112a);
}

/* 全局主题配置 */
final ThemeData MeThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    color: ThemeColor.dfnBlue,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: Typography.englishLike2018
      .apply(fontSizeFactor: 1.sp, bodyColor: ThemeColor.ayBlue),
);
