// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 全局主题颜色配置 */
class ThemeColor {
  /* 元青 */
  static Color textBodyColor = const Color(0xff3e3c3d);
    /* 暗夜蓝 */
  static Color ayBlue = const Color(0xff0c112a);
  /* 蒂芙尼蓝 */
  static Color dfnBlue = const Color(0xff81d8d0);
  /* 克莱因蓝 */
  static Color klyBlue = const Color(0xff002ea6);
  /* 纯白 */
  static Color pureWhite = const Color(0xfff5f2e9);


  /* 浅驼色 */
  static Color lightCamel = const Color(0xffffd4a9);

  ///Line-线的颜色
  static Color colorLine = const Color(0xffeceeef);


  /* 999 */
  static Color c_9 = const Color(0xff999999);
  /* 666 */
  static Color c_6 = const Color(0xff666666);
  /* 333 */
  static Color c_3 = const Color(0xff333333);
  /* fa */
  static Color c_fa = const Color(0xfffafafa);
  /* f5 */
  static Color c_f5 = const Color(0xfff5f5f5);
  /* ff */
  static Color c_ff = const Color(0xffffffff);
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
