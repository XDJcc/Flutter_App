import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_flutter/app/utils/themeData.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int count = 3;
  Timer? _timer;

  @override
  void initState() {
    _startTime();
    super.initState();
  }

  void _startTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      count--;
      if (count == 0) {
        _timer?.cancel();
        // _toHome();
      }
      setState(() {});
    });
  }

  void _toHome() {
    _timer?.cancel();
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    Size winSize = MediaQuery.of(context).size;
    double padding = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          child: Container(
            width: winSize.width,
            height: winSize.height,
            color: ThemeColor.dfnBlue,
            alignment: Alignment.center,
            child: Text(
              'XDJ',
              style: TextStyle(
                  fontSize: 54.sp,
                  fontWeight: FontWeight.bold,
                  color: ThemeColor.pureWhite),
            ),
          ),
        ),
        Positioned(
          right: 20.w,
          top: padding + 20.w,
          child: InkWell(
            onTap: () {
              _toHome();
            },
            child: Container(
              width: 50.w,
              height: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: Colors.blue[50],
              ),
              alignment: Alignment.center,
              child: Text(
                '关闭${count}s',
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
