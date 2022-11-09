import 'package:flutter/material.dart';
import 'package:flutter_app/app/global/global.dart';
import 'package:flutter_app/app/global/sp_utils.dart';
import 'package:flutter_app/app/models/user_info_model.dart';
import 'package:flutter_app/app/network/request_interceptor.dart';
import 'package:flutter_app/app/ui/base_controller.dart';
import 'package:flutter_app/app/utils/Toasd.dart';
import 'package:flutter_app/app/utils/xcc_write.dart';
import 'package:flutter_app/login_page/request.dart';

class LoginController extends BaseController {
  String phoneNumber = '';
  String verificationCode = '';

  @override
  void onReady() {
    super.onReady();
    XccLog.write('我是登录界面');
  }

  void inputChange(bool val, String thing) {
    if (val) {
      phoneNumber = thing;
    } else {
      verificationCode = thing;
    }
  }

  void inputSubmitted(String val) {}

  Future<bool> login() async {
    if (phoneNumber.length != 11 || verificationCode.length != 6) {
      XToast.toastShow('帐号或者密码错误，请重试');
      return false;
    }
    SPUtils.remove(kTokenKey);
    var res = await LoginRequest.sendVerificationCode(phoneNumber);
    XccLog.write(res);
    await Future.delayed(const Duration(seconds: 1));
    var data = await LoginRequest.userLogin(phoneNumber, verificationCode);
    UserInfo userInfo = UserInfo.fromJson(data['data']);
    SPUtils.putString(kTokenKey, userInfo.token);
    GlobalData.userId = userInfo.id;
    GlobalData.userInfo = userInfo;
    if (data['code'] == 200) {
      return true;
    } else {
      XToast.toastShow('网络错误，请稍后重试');
      return false;
    }
  }
}
