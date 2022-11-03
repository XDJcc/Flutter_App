/// @XDJcc
/// @Time:2022-8-25
/// 说明： sliver 吸顶

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverPersistentHeaderDemoPage extends StatefulWidget {
  const SliverPersistentHeaderDemoPage({Key? key}) : super(key: key);

  @override
  State<SliverPersistentHeaderDemoPage> createState() =>
      _SliverPersistentHeaderDemoPageState();
}

class _SliverPersistentHeaderDemoPageState
    extends State<SliverPersistentHeaderDemoPage> {
  final list = [1, 2, 3, 4, 5, 6,7 ,7,8,9,5,34,34,5345, ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
         const SliverAppBar(
            pinned: true,
          ),
          ...list
              .map(
                (e) => SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.all(10.w),
                    height: 40.w,
                    width: double.infinity,
                    child: Text('$e'),
                  ),
                ),
              )
              .toList(),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverDelegate(
              child: Container(
                width: 414.w,
                height: 200.w,
                color: Colors.red,
                child: const Text('我是吸顶'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ...list
                    .map((e) => Container(
                          width: double.infinity,
                          height: 100.w,
                          margin: EdgeInsets.all(20.w),
                          color: const Color.fromARGB(255, 212, 244, 54),
                        ))
                    .toList(),
              ],
            ),
            // Stack(
            //   children: [

            //     SliverPersistentHeader(
            //       delegate: SliverDelegate(
            //         child: Container(
            //           width: double.infinity,
            //           height: 100.w,
            //           color: Colors.amber,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  SliverDelegate({required this.child});

  final Widget child;

  @override
  double get maxExtent => 50.w;

  @override
  double get minExtent => 50.w;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override //是否需要重建
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
