import 'dart:async';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/app/components/GoodsListCard/GoodsLisCard.dart';
import 'package:flutter_app/app/components/cached_network_image/cached_network_image.dart';
import 'package:flutter_app/app/utils/Toasd.dart';
import 'package:flutter_app/app/utils/themeData.dart';

import 'components/square_swiper_pagination.dart';
import 'components/x_swiper_controller.dart';

class NestedScrollViewDemoPage extends StatefulWidget {
  const NestedScrollViewDemoPage({Key? key}) : super(key: key);

  @override
  State<NestedScrollViewDemoPage> createState() =>
      _NestedScrollViewDemoPageState();
}

class _NestedScrollViewDemoPageState extends State<NestedScrollViewDemoPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  final ScrollController scrollController = ScrollController();

  final XccSwiperController swiperController = XccSwiperController();

  bool is_show = false;

  Map<String, GlobalKey> goodsKeyMap = {};

  final List<String> _tabs = [
    '风神传',
    '封妖志',
    "幻将录",
    "我是张三",
    "凡人修仙传",
  ];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      _tabs.map((e) {
        goodsKeyMap[e] = GlobalKey();
      });
      tabController = TabController(
          initialIndex: 0,
          // animationDuration: const Duration(milliseconds: 100),
          length: _tabs.length,
          vsync: this)
        ..addListener(() {});
      scrollController.addListener(() {
        // log('scroll=>>>1:${scrollController.position}');
        // log('scroll=>>>2:${scrollController.position.pixels}');
        // log('scroll=>>>3:${scrollController.offset}');
      });
      setState(() {
        is_show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return !is_show
        ? Container(
            width: size.width,
            height: size.height,
            color: ThemeColor.c_ff,
          )
        : SizedBox(
            width: size.width,
            child: Scaffold(
              backgroundColor: ThemeColor.c_f5,
              body: RefreshIndicator(
                color: const Color(0xffffb85a),
                notificationPredicate: (ScrollNotification notifation) {
                  ScrollMetrics scrollMetrics = notifation.metrics;
                  if (scrollMetrics.minScrollExtent == 0) {
                    return true;
                  } else {
                    return false;
                  }
                },
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 1000));
                  XToast.toastShow('刷新');
                  return Future.value(true);
                },
                child: NestedScrollView(
                  controller: scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                          backgroundColor: ThemeColor.c_ff,
                          centerTitle: true,
                          title: InkWell(
                            onTap: () {
                              swiperController.toNext();
                            },
                            child: Text(
                              '新品速递',
                              style: TextStyle(
                                  color: ThemeColor.c_3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          leading: InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              size: 18,
                              color: ThemeColor.c_3,
                            ),
                          ),
                          pinned: true,
                          elevation: 0,
                          forceElevated: innerBoxIsScrolled, //为true时展开有阴影
                          expandedHeight: 300.w,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                              children: [
                                Positioned(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300.w,
                                  child: Stack(children: [
                                    Container(
                                      height: 237.w,
                                      width: double.infinity,
                                      child: CaCheImageWidget(
                                        'https://img0.baidu.com/it/u=2272353480,4072896150&fm=253&fmt=auto&app=120&f=JPEG?',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        color: Colors.white.withAlpha(0),
                                      ),
                                    )
                                  ]),
                                ),
                                Positioned(
                                  top: 80.w,
                                  left: 0,
                                  child: Container(
                                    width: size.width,
                                    height: 200.w,
                                    child: SwiperCustonWidget(swiperController),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          bottom: PreferredSize(
                            preferredSize:
                                Size(MediaQuery.of(context).size.width, 50.w),
                            child: Container(
                              width: double.infinity,
                              height: 50.w,
                              color: ThemeColor.c_f5,
                              child: TabBar(
                                controller: tabController,
                                isScrollable: true,
                                padding: const EdgeInsets.all(0),
                                labelColor: ThemeColor.c_3,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                                unselectedLabelColor: ThemeColor.c_9,
                                unselectedLabelStyle: TextStyle(
                                  fontSize: 18.sp,
                                ),
                                indicatorPadding:
                                    EdgeInsets.only(bottom: 5.w, top: 43.w),
                                indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.w),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x4DF29E2B),
                                      offset: Offset(0, 2.w),
                                      blurRadius: 3.w,
                                    )
                                  ],
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFFFFA600),
                                      Color(0xFFFFCE0F),
                                    ],
                                  ),
                                ),
                                tabs: _tabs
                                    .map(
                                      (String name) => Tab(
                                        text: name,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: _buildTabBarView(),
                ),
              ),
            ),
          );
  }

  // Widget _buildTabBarView() {
  //   return TabBarView(
  //     controller: tabController,
  //     children: _tabs.map((String name) {
  //       return SafeArea(
  //         top: false,
  //         bottom: false,
  //         child: Builder(
  //           builder: (BuildContext context) {
  //             return CustomScrollView(
  //               key: PageStorageKey<String>(name),
  //               slivers: <Widget>[
  //                 SliverOverlapInjector(
  //                   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
  //                       context),
  //                 ),
  //                 SliverPadding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   sliver: SliverFixedExtentList(
  //                     itemExtent: 48.0,
  //                     delegate: SliverChildBuilderDelegate(
  //                       (BuildContext context, int index) {
  //                         return ListTile(
  //                           title: Text('《$name》 第 $index章'),
  //                         );
  //                       },
  //                       childCount: 20,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             );
  //           },
  //         ),
  //       );
  //     }).toList(),
  //   );
  // }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: tabController,
      children: _tabs.map((String name) {
        debugPrint('$name');
        return GoodsDetailList(1, key: goodsKeyMap[name]);
      }).toList(),
    );
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
    scrollController.dispose();
    swiperController.dispose();
  }
}

class SwiperCustonWidget extends StatelessWidget {
  final XccSwiperController swiperController;
  const SwiperCustonWidget(this.swiperController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
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
    );
  }
}
