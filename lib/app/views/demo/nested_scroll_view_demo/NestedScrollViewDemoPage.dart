import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_flutter/app/utils/themeData.dart';
import 'package:study_flutter/app/views/demo/nested_scroll_view_demo/components/square_swiper_pagination.dart';
import 'package:study_flutter/app/views/demo/nested_scroll_view_demo/components/x_swiper_controller.dart';

class NestedScrollViewDemoPage extends StatefulWidget {
  const NestedScrollViewDemoPage({Key? key}) : super(key: key);

  @override
  State<NestedScrollViewDemoPage> createState() =>
      _NestedScrollViewDemoPageState();
}

class _NestedScrollViewDemoPageState extends State<NestedScrollViewDemoPage> {
  final XccSwiperController swiperController = XccSwiperController();
  Timer? _timer;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 200.w,
      child: Swiper(
        controller: swiperController,
        pagination: SquareSwiperPagination(
            builder: SquareSwiperPaginationBuilder(
                activeColor: ThemeColor.dfnBlue,
                color: ThemeColor.c_6,
                size: 7.w,
                activeSize: 17.w)),
        loop: true,
        axisDirection: AxisDirection.right,
        scrollDirection: Axis.horizontal,
        layout: SwiperLayout.CUSTOM,
        // autoplay: true,
        duration: 800,
        // autoplayDelay: 4000,
        customLayoutOption: CustomLayoutOption(startIndex: -2, stateCount: 5)
          ..addTranslate([
            Offset(-322.w, 70.w),
            Offset(-222.w, 35.w),
            Offset(0.0, -15.w),
            Offset(223.w, 35.w),
            Offset(323.w, 70.w),
          ])
          ..addRotate([
            -48.0 / 180,
            -24.0 / 180,
            0.0,
            24.0 / 180,
            48.0 / 180,
          ])
          ..addScale([
            0.1,
            0.5,
            1,
            0.5,
            0.1,
          ], Alignment.center),
        itemWidth: 232.w,
        itemHeight: 154.w,
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: index == 1
                    ? Colors.white
                    : index == 2
                        ? Colors.red
                        : Color.fromARGB(255, 153, 207, 36),
                borderRadius: BorderRadius.circular(8.w),
                border: Border.all(color: Colors.white, width: 2.w)),
            child: Center(
              child: Text("$index"),
            ),
          );
        },
      ),
    );
  }
}
