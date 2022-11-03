// import 'package:flutter_app/app/netWork/network_utils.dart';
// import '../app/network/request.dart';

import 'package:flutter_app/app/network/request.dart';

abstract class LoginRequest {
  static sendVerificationCode(String phoneNumber) async {
    // final response = await NetworkUtils.dio.post('/sendVerificationCode',
    //     data: {"dontUseToken": true, "phone": phoneNumber});
    final response = await Request.post('/sendVerificationCode',
        data: {"dontUseToken": true, "phone": phoneNumber});
    return response.data;
  }

  static userLogin(String phoneNumber, String verificationCode) async {
    final response = await Request.post('/login', data: {
      "phone": phoneNumber,
      "verificationCode": verificationCode,
    });

    return response.data;
  }
}
