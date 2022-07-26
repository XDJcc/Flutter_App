
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 
  toast 
 */
class XToast {
  // static dynamic context;
  static toastShow(
    message, {
    String? position,
  }) {
    var align = Alignment.center;
    if (position == "top") {
      align = const Alignment(0, -0.8);
    } else if (position == "bottom") {
      align = const Alignment(0, 0.8);
    }
    BotToast.showText(
      text: message,
      contentColor: const Color(0xBF000000),
      textStyle: TextStyle(fontSize: 16.sp, color: Colors.white),
      align: align,
      contentPadding: EdgeInsets.fromLTRB(22.w, 10.w, 22.w, 10.w),
      borderRadius: BorderRadius.circular(50.w),
      duration: const Duration(seconds: 3),
    );
  }

}
