import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_app/app/global/sp_utils.dart';
import 'package:flutter_app/app/router/uni_router.dart';
import 'package:flutter_app/app/utils/Toasd.dart';
import 'package:flutter_app/navgation/flutter_main.dart';

const kTokenKey = 'Authorization';

class NetworkInterceptors extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.method == "GET") {
      // Get 是否去除token
      if (options.queryParameters["dontUseToken"] != null &&
          options.queryParameters["dontUseToken"]) {
        return handler.next(options);
      }
    } else if (options.method == "POST") {
      if (options.data is Map) {
        // // Post 是否去除token
        if (options.data != null &&
            options.data["dontUseToken"] != null &&
            options.data["dontUseToken"]) {
          return handler.next(options);
        }
      }
    }

    var token = SPUtils.getString(kTokenKey);
    if (token.isNotEmpty) {
      options.headers[kTokenKey] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 200) {
      //访问正确有返回值的情况
      response.statusCode = response.data['code'];
      response.statusMessage = response.data['msg'];
      if (response.data['code'] == 200) {
        return handler.resolve(response);
      } else if (response.data['code'] == 430) {
        /* 内容有敏感词， */
      } else if (response.data['code'] == 401) {
        /* 跳转到登录页面 */
        XToast.toastShow('请前往登陆界面登陆账号');
        navigatorKey.currentState?.pushNamed(UnitRouter.login);
      } else if (response.data['code'] == 500) {
        /* 跳转到登录页面 */
        String msg = response.data['msg'];
        if (msg.isEmpty) {
          msg = "服务器请求失败";
        }
        XToast.toastShow(msg);
      } else {
        /* 错误 */
        handler.resolve(response);
      }
    }
    return handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    throw DioError(
        requestOptions: err.requestOptions,
        type: err.type,
        error: err,
        response: err.response);
  }
}
