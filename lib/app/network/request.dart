/* 
import netWorkUtil 类的时候
只能使用提示第一条的导入文件。
使用第二条导入的时候就会出现错误
 */

import 'dart:developer';

import 'package:flutter_app/app/netWork/network_utils.dart';

// import '../netWork/network_utils.dart';

class Request {
  static get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response =
        await NetworkUtils.dio.get(path, queryParameters: queryParameters);
    log('''
**************************
******  url 
$path
******  params 
$queryParameters
******  response 
$response
**************************
''');
    return response;
  }

  static post(String path, {Map<String, dynamic>? data}) async {
    final response = await NetworkUtils.dio.post(path, data: data);
    log('''
**************************
******  url 
$path
******  params 
$data
******  response 
$response
**************************
''');
    return response;
  }
}
