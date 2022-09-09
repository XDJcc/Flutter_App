


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:study_flutter/app/config/config.dart';
import 'package:study_flutter/app/netWork/requestUtil.dart';

class NetworkUtils {
  static late DioRequest _request;

  static Dio get dio => _request.dio;

  static Future initNetwork() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    var dir = Directory("$documentsPath/cookies");

    _request = DioRequest.defaultInstance(
        baseUrl: Config.BASE_URL,
        cookiePath: dir.path,
        interceptorList: [
          // TokenInterceptors(),
          // RequestInterceptor(),
          // LogsInterceptors()
        ]);
  }
}
