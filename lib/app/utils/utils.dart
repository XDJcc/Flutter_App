import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/app/config/config.dart';

const Map<String, Color> emumMap = {
  "Objective-C": Color(0xFF438EFF),
  "Perl": Color(0xFF0298C3),
  "Python": Color(0xFF0298C3),
  "JavaScript": Color(0xFFF1E05A),
  "PHP": Color(0xFF4F5D95),
  "R": Color(0xFF188CE7),
  "Lua": Color(0xFFC22D40),
  "Scala": Color(0xFF020080),
  "Swift": Color(0xFFFFAC45),
  "Kotlin": Color(0xFFF18E33),
  "Vue": Colors.black,
  "Ruby": Color(0xFF701617),
  "Shell": Color(0xFF89E051),
  "TypeScript": Color(0xFF2B7489),
  "C++": Color(0xFFF34B7D),
  "CSS": Color(0xFF563C7C),
  "Java": Color(0xFFB07219),
  "C#": Color(0xFF178600),
  "Go": Color(0xFF375EAB),
  "Erlang": Color(0xFFB83998),
  "C": Color(0xFF555555),
};

class Util {
  static String getTimeDuration(String comTime) {
    var nowTime = DateTime.now();
    var compareTime = DateTime.parse(comTime);
    if (nowTime.isAfter(compareTime)) {
      if (nowTime.year == compareTime.year) {
        if (nowTime.month == compareTime.month) {
          if (nowTime.day == compareTime.day) {
            if (nowTime.hour == compareTime.hour) {
              if (nowTime.minute == compareTime.minute) {
                return '片刻之间';
              }
              return '${nowTime.minute - compareTime.minute}分钟前';
            }
            return '${nowTime.hour - compareTime.hour}小时前';
          }
          return '${nowTime.day - compareTime.day}天前';
        }
        return '${nowTime.month - compareTime.month}月前';
      }
      return '${nowTime.year - compareTime.year}年前';
    }
    return 'time error';
  }

  static double setPercentage(percentage, context) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static Color? getLangColor(String language) {
    if (emumMap.containsKey(language)) {
      return emumMap[language];
    }
    return Colors.black26;
  }

  static String getTimeDate(String comTime) {
    var compareTime = DateTime.parse(comTime);
    String weekDay = '';
    switch (compareTime.weekday) {
      case 2:
        weekDay = '周二';
        break;
      case 3:
        weekDay = '周三';
        break;
      case 4:
        weekDay = '周四';
        break;
      case 5:
        weekDay = '周五';
        break;
      case 6:
        weekDay = '周六';
        break;
      case 7:
        weekDay = '周日';
        break;
      default:
        weekDay = '周一';
    }
    return '${compareTime.month}-${compareTime.day}  $weekDay';
  }

  /// 日期字符串格式化
  /// date:日期
  /// formateString：想要的日期格式
  ///
  ///  */
  static String formatDate(date, formateString) {
    DateTime d;
    try {
      if (date is String) {
        d = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
      } else {
        d = date;
      }
      String formateDataString =
          DateFormat(formateString, const Locale('zh').toString()).format(d);
      return formateDataString;
    } catch (e) {
      return formateString;
    }
  }

  ///获取设备信息
  static get deviceInfo async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, dynamic> deviceData = <String, dynamic>{};
    AndroidDeviceInfo? androidInfo;
    IosDeviceInfo? iosInfo;
    if (Platform.isIOS) {
      iosInfo = await deviceInfoPlugin.iosInfo;
    } else {
      androidInfo = await deviceInfoPlugin.androidInfo;
    }
    deviceData = _readDeviceInfo(androidInfo, iosInfo);
    return deviceData;
  }

  static get printIps async {
    String ipStr = '';
    try {
      final dio = Dio();
      final response = await dio.get(Config.BASE_IP);
      final data = response.data;
      if (data != null && data is Map) {
        ipStr = data['ipaddress'] ?? '';
      }
    } catch (e) {
      debugPrint('$e');
    }
    return ipStr;
  }

  static _readDeviceInfo(
      AndroidDeviceInfo? androidInfo, IosDeviceInfo? iosInfo) {
    Map<String, dynamic> data = <String, dynamic>{
      //手机品牌加型号
      "brand": Platform.isIOS
          ? iosInfo?.utsname.machine
          : "${androidInfo?.brand} ${androidInfo?.model}",
      //当前系统版本
      "systemVersion": Platform.isIOS
          ? iosInfo?.systemVersion
          : androidInfo?.version.release,
      //系统名称
      "platform": Platform.isIOS ? iosInfo?.systemName : "Android",
      //是不是物理设备
      "isPhysicalDevice": Platform.isIOS
          ? iosInfo?.isPhysicalDevice
          : androidInfo?.isPhysicalDevice,
      //用户唯一识别码
      "uuid": Platform.isIOS
          ? iosInfo?.identifierForVendor
          : androidInfo?.androidId,
      //手机具体的固件型号/Ui版本
      "incremental": Platform.isIOS
          ? iosInfo?.systemVersion
          : androidInfo?.version.incremental,
    };
    return data;
  }

  ///日期转时间戳
  static int dateToTimestamp(String date, {isMicroseconds = false}) {
    DateTime dateTime = DateTime.parse(date);
    int timestamp = dateTime.millisecondsSinceEpoch;
    if (isMicroseconds) {
      timestamp = dateTime.microsecondsSinceEpoch;
    }
    return timestamp;
  }

  static DateTime timestampToDate(int timestamp) {
    DateTime dateTime = DateTime.now();

    ///如果是十三位时间戳返回这个
    if (timestamp.toString().length == 13) {
      dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    } else if (timestamp.toString().length == 16) {
      ///如果是十六位时间戳
      dateTime = DateTime.fromMicrosecondsSinceEpoch(timestamp);
    }
    return dateTime;
  }

  ///时间戳转日期
  ///[timestamp] 时间戳
  ///[onlyNeedDate ] 是否只显示日期 舍去时间
  static String timestampToDateStr(int timestamp, {onlyNeedDate = false}) {
    DateTime dataTime = timestampToDate(timestamp);
    String dateTime = dataTime.toString();

    ///去掉时间后面的.000
    dateTime = dateTime.substring(0, dateTime.length - 4);
    if (onlyNeedDate) {
      List<String> dataList = dateTime.split(" ");
      dateTime = dataList[0];
    }
    return dateTime;
  }

  static DateTime _changeTimeDate(time) {
    ///如果传进来的是字符串 13/16位 而且不包含-
    DateTime dateTime = DateTime.now();
    if (time is String) {
      if ((time.length == 13 || time.length == 16) && !time.contains("-")) {
        dateTime = timestampToDate(int.parse(time));
      } else {
        dateTime = DateTime.parse(time);
      }
    } else if (time is int) {
      dateTime = timestampToDate(time);
    }
    return dateTime;
  }
}
