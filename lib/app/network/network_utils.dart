import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/app/config/config.dart';
import 'package:flutter_app/app/netWork/request_interceptor.dart';
import 'package:flutter_app/app/netWork/request_util.dart';

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
          NetworkInterceptors()
          // TokenInterceptors(),
          // RequestInterceptor(),
          // LogsInterceptors()
        ]);
  }


}
