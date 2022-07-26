import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/router/uni_router.dart';
import 'package:flutter_app/app/utils/Toasd.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/app/ui/base_page.dart';
import 'package:flutter_app/app/utils/themeData.dart';

import 'login_page_controller.dart';

class LoginPage extends BasePage<LoginController> {
  const LoginPage({super.key});

  @override
  LoginController create(BuildContext context) {
    return LoginController();
  }

  @override
  Widget buildWidget(BuildContext context, LoginController controller) {
    LoginController c = context.read<LoginController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // leading: GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: const Icon(Icons.arrow_back),
          // ),
          title: Text(
            '登陆/注册',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ThemeColor.textBodyColor),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(20.w),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w),
                    boxShadow: [
                      BoxShadow(
                        color: ThemeColor.c_9,
                        offset: Offset(-1.w, 2.w),
                        blurRadius: 5,
                        spreadRadius: 0,
                      )
                    ]),
                height: 200.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Selector<LoginController, String>(
                      selector: (c, p) => p.phoneNumber,
                      builder: (_, C, __) {
                        LoginController c = context.read<LoginController>();
                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.w,
                                color: ThemeColor.colorLine,
                              ),
                            ),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              //限制只能输入 11 位数字
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(11),
                            ],
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: ThemeColor.ayBlue,
                            ),
                            /*光标样式*/
                            cursorColor: ThemeColor.ayBlue,
                            cursorWidth: 2.0.w,
                            cursorHeight: 30.0.w,
                            textInputAction: TextInputAction.done,
                            /*输入框样式*/
                            decoration: InputDecoration(
                              hintText: '请输入手机号',
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.phone_android),
                              contentPadding: EdgeInsets.all(20.w),
                              hintStyle: TextStyle(
                                height: 1.05,
                                color: const Color.fromRGBO(219, 223, 225, 1),
                                fontSize: 18.sp,
                              ),
                            ),
                            onChanged: (String val) => c.inputChange(true, val),
                            onSubmitted: (String val) {},
                          ),
                        );
                      },
                    ),
                    Selector<LoginController, String>(
                      selector: (c, p) => p.phoneNumber,
                      builder: (_, C, __) {
                        LoginController c = context.read<LoginController>();
                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.w,
                                color: ThemeColor.colorLine,
                              ),
                            ),
                          ),
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              //限制只能输入 6 位数字
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: ThemeColor.ayBlue,
                            ),
                            /*光标样式*/
                            cursorColor: ThemeColor.ayBlue,
                            cursorWidth: 2.0.w,
                            cursorHeight: 30.0.w,
                            textInputAction: TextInputAction.done,
                            /*输入框样式*/
                            decoration: InputDecoration(
                              hintText: '请输入密码',
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.ac_unit_outlined),
                              contentPadding: EdgeInsets.all(20.w),
                              hintStyle: TextStyle(
                                height: 1.05,
                                color: const Color.fromRGBO(219, 223, 225, 1),
                                fontSize: 18.sp,
                              ),
                            ),
                            onChanged: (String val) =>
                                c.inputChange(false, val),
                            onSubmitted: (String val) {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (await c.login()) {
                Navigator.of(context).pushNamed(UnitRouter.home);
              }
            },
            child: Icon(
              Icons.call_made_sharp,
              color: ThemeColor.ayBlue,
              size: 35.w,
            )),
      ),
    );
  }
}
