/// @XDJcc
///
/// 说明：寻味特色
///

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_flutter/app/components/back_drop/back_drop.dart';
import 'package:study_flutter/app/components/cached_network_image/cached_network_image.dart';
import 'package:study_flutter/app/utils/themeData.dart';

import 'drop_down.dart';

class LookForFlavorPage extends StatefulWidget {
  const LookForFlavorPage({Key? key}) : super(key: key);

  @override
  State<LookForFlavorPage> createState() =>
      _LookForFlavorPageState();
}

class _LookForFlavorPageState extends State<LookForFlavorPage>
    with SingleTickerProviderStateMixin {
  /* 是否初始化完成 */
  bool _is_show = false;
  /*  滚动 */
  final ScrollController _scrollController = ScrollController();
  /*  页面滚动 */
  final ScrollController _pageScrollController = ScrollController();
  /* tabbar */
  late final TabController? _tabbarController;
  /* pageView */
  PageController pageController = PageController(initialPage: 0);
  /* 当前页面 */
  int currentPage = 0;
  /* 是否是 apgeview 滚动 */
  bool isPageCanChanged = true;
  /* 吸顶滚动 背景颜色 渐变值   0 - 255  */
  int _opacity = 0;
  /* 是否滚动到顶部 */
  bool _isScrollTop = false;
  /* keyMap */
  Map<String, GlobalKey> articleKeyMap = {};
  /* 是否切换完成 */
  bool isChangeEnd = true;

  Widget _selectionTagWidget = Container();
  /* 
      筛选条件参数
   */

  GlobalKey<DropDownScreenState> dropKey = GlobalKey();
  /* 是否展开筛选 */
  bool showBootom = false;
  /* 
    展开的筛选ID
    1 品类 2品牌  3筛选 4智能排序
   */
  int selectionId = 0;

  /* 模拟 tabbar 数据 */
  final _tab = ['咖啡', '奶茶', '果茶', '矿泉水', '甜点', '薯片', '方便面'];
  List tagList = [
    {
      "id": 1,
      "name": '商品asd标签',
      "selection": false,
    },
    {
      "id": 2,
      "name": '商品asdadada标签',
      "selection": false,
    },
    {
      "id": 3,
      "name": '商标签',
      "selection": false,
    },
    {
      "id": 4,
      "name": '标签',
      "selection": false,
    },
    {
      "id": 5,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 6,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 7,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
    {
      "id": 8,
      "name": '商品标签',
      "selection": false,
    },
  ];

  List selectionList = [
    {
      "id": 1,
      "name": '口味类型',
      "typeList": [
        {
          "id": 1,
          'name': '高甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '中甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
      ]
    },
    {
      "id": 1,
      "name": '口味类型',
      "typeList": [
        {
          "id": 1,
          'name': '高甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '中甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
      ]
    },
    {
      "id": 1,
      "name": '口味类型',
      "typeList": [
        {
          "id": 1,
          'name': '高甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '中甜',
          "selection": false,
        },
        {
          "id": 1,
          'name': '低甜',
          "selection": false,
        },
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      /* 模拟获取数据初始化tbabr */
      _tabbarController = TabController(
        length: _tab.length,
        vsync: this,
        initialIndex: 0,
        // animationDuration: const Duration(milliseconds: 100),
      )..addListener(() {
          if (_tabbarController!.indexIsChanging) {
            //判断TabBar是否切换
            onPageChange(_tabbarController!.index, p: pageController);
          }
        });
      _pageScrollController.addListener(() {
        // print('scroll=>>>1:${_pageScrollController.position}');
        // print('scroll=>>>2:${_pageScrollController.position.pixels}');
        // print('scroll=>>>3:${_pageScrollController.offset}');
        // print('scroll=>>>4:${140.w}');

        setState(() {
          _opacity = ((((_pageScrollController.position.pixels) / 140.w) * 255)
                      .round() >
                  255)
              ? 255
              : (((_pageScrollController.position.pixels) / 140.w) * 255)
                  .round();
        });
        // print(
        //     'sadadaadadadadsa====>$_opacity----${5 % 2}---${(((_pageScrollController.position.pixels % 140.w) / 140.w) * 255).round()}');
        // if (_pageScrollController.offset >= 90.w) {
        //   print('scroll=>>>5:${140.w}');
        //   setState(() {
        //     _isScrollTop = true;
        //   });
        // } else {
        //   print('scroll=>>>6:${140.w}');
        //   setState(() {
        //     _isScrollTop = false;
        //   });
        // }
      });
      setState(() {
        _is_show = true;
      });
    });
  }

  onPageChange(int index, {PageController? p, TabController? t}) async {
    if (p != null) {
      //判断是哪一个切换
      isPageCanChanged = false;
      await pageController.animateToPage(index,
          duration: const Duration(milliseconds: 100),
          curve: Curves.linear); //等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      _tabbarController!.animateTo(index); //切换Tabbar
    }

    // 双  更新自定义滚动
    setState(() {
      currentPage = index;
    });
    double offsetLeft = 0;
    // offsetLeft = (index * 100.w + 60.w - 212.w) < 0
    //     ? 0
    //     : (index * 100.w + 60.w - 212.w) > (index * 100.w + 20.w - 414.w)
    //         ? (index * 100.w + 20.w - 414.w)
    //         : (index * 100.w + 60.w - 212.w);
    offsetLeft = index * 90.w + 44.w - 212.w;
    _scrollController.animateTo(offsetLeft,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  void updateSelection(params, type) {
    if (type == 0) {
      _initGetSelectionList();
    }
    _pageScrollController.animateTo(
        _pageScrollController.position.maxScrollExtent - 44.w - 50.w,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear);

    setState(() {
      showBootom = params;
      selectionId = type;
      if (type == 1 && params == true) {
        // Future.delayed(Duration(milliseconds: 300), () {
        // _createTag();
        // });
      }
    });
  }

  _initGetSelectionList() {
    for (var e in tagList) {
      tagList[tagList.indexOf(e)]['selection'] = false;
    }
    for (var data in selectionList) {
      for (var e in data['typeList']) {
        e['selection'] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double paddingTop = MediaQuery.of(context).padding.top;
    return Container(
      width: size.width,
      height: size.height,
      color: const Color(0xFF666666),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 400.w,
            child: initBg(),
          ),
          Scaffold(
              backgroundColor: Color.fromARGB(_opacity, 53, 56, 63),
              appBar: PreferredSize(
                preferredSize: Size(size.width, 50.w),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'assets/images/arrow_back.png',
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                  title: Text(
                    '寻味特色',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  elevation: 0,
                ),
              ),
              body: Stack(
                children: [
                  NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      if (notification is ScrollStartNotification) {
                        // print("开始滚动");
                      } else if (notification is ScrollUpdateNotification) {
                        // print("正在滚动。。。总滚动距离：${notification.metrics.pixels}");
                        // print("正在滚动。。。总滚动距离：${140.w}");

                        if (notification.metrics.pixels >= 140.w) {
                          if (_isScrollTop != true) {
                            setState(() {
                              _isScrollTop = true;
                            });
                          }
                        } else {
                          if (_isScrollTop != false) {
                            setState(() {
                              _isScrollTop = false;
                            });
                          }
                        }
                      } else if (notification is ScrollEndNotification) {
                        // print("结束滚动");
                      }

                      return true;
                    },
                    child: !_is_show
                        ? const SizedBox()
                        : NestedScrollView(
                            controller: _pageScrollController,
                            headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) {
                              return <Widget>[
                                SliverToBoxAdapter(
                                  child: initScroll(),
                                ),
                                SliverPersistentHeader(
                                  pinned: true,
                                  delegate: SliverDelegate(
                                    extentHeight: 30.w,
                                    // child: Container(),
                                    child: initTopTabbar(),
                                  ),
                                ),
                                SliverPersistentHeader(
                                  pinned: true,
                                  delegate: SliverDelegate(
                                    extentHeight: 20.w,
                                    child: initTabIconScroll(),
                                  ),
                                ),
                                SliverPersistentHeader(
                                    pinned: true,
                                    delegate: SliverDelegate(
                                        extentHeight: 44.w,
                                        child: dropWapper())),
                              ];
                            },
                            body: PageView.builder(
                              controller: pageController,
                              itemCount: _tab.length,
                              onPageChanged: (index) {
                                if (isPageCanChanged) {
                                  //由于pageview切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制pageview的回调
                                  onPageChange(index);
                                }
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  color: ThemeColor.c_f5,
                                  child: ListView.builder(
                                    itemCount: 40,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return const FlavorGoodsCard();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ],
              )),
          showBootom
              ? InkWell(
                  onTap: () {
                    // setState(() {
                    //   showBootom = false;
                    // });
                    dropKey.currentState?.changeSelection(false);
                  },
                  child: SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Column(children: [
                      SizedBox(
                        width: size.width,
                        height: paddingTop + 50.w + 50.w + 44.w,
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.black.withOpacity(0.3),
                      ))
                    ]),
                  ),
                )
              : Container(),
          Offstage(
            offstage: !(selectionId == 1),
            child: AnimatedContainer(
              margin: EdgeInsets.only(top: paddingTop + 50.w + 50.w + 44.w),
              duration: const Duration(milliseconds: 300),
              width: size.width,
              height: showBootom ? 500.w : 0,
              color: ThemeColor.c_ff,
              child: showBootom ? _createTag() : const SizedBox(),
            ),
          ),
          Offstage(
            offstage: !(selectionId == 2),
            child: AnimatedContainer(
              margin: EdgeInsets.only(top: paddingTop + 50.w + 50.w + 44.w),
              duration: const Duration(milliseconds: 300),
              width: size.width,
              height: showBootom ? 500.w : 0,
              color: ThemeColor.c_ff,
              child: showBootom ? _createBrand() : const SizedBox(),
            ),
          ),
          Offstage(
            offstage: !(selectionId == 3),
            child: AnimatedContainer(
              margin: EdgeInsets.only(top: paddingTop + 50.w + 50.w + 44.w),
              duration: const Duration(milliseconds: 300),
              width: size.width,
              height: showBootom ? 500.w : 0,
              color: ThemeColor.c_ff,
              child: showBootom ? _createSelection() : const SizedBox(),
            ),
          ),
          Offstage(
            offstage: !(selectionId == 4),
            child: AnimatedContainer(
              margin: EdgeInsets.only(top: paddingTop + 50.w + 50.w + 44.w),
              duration: const Duration(milliseconds: 300),
              width: size.width,
              height: showBootom ? 500.w : 0,
              color: ThemeColor.c_ff,
              child: showBootom ? _createSort() : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createSort() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: selectionList.map<Widget>((item) {
                // var itemList = [...item['typeList']];
                // if (item['typeList'].length > 6) {
                //   itemList.removeRange(6, item['typeList'].length);
                // }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.w),
                      child: Text(item['name']),
                    ),
                    Wrap(
                      children: item['typeList'].map<Widget>((e) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              item['typeList'][item['typeList'].indexOf(e)]
                                      ['selection'] =
                                  !item['typeList'][item['typeList'].indexOf(e)]
                                      ['selection'];
                              print(item['typeList']
                                  [item['typeList'].indexOf(e)]['selection']);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20.w, right: 20.w),
                            padding: EdgeInsets.fromLTRB(18.w, 5.w, 18.w, 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.w),
                                color: e['selection']
                                    ? const Color(0xFFFEF8ED)
                                    : const Color(0xFFF0F3F6)),
                            child: Text(
                              e['name'],
                              style: TextStyle(
                                color: e['selection']
                                    ? const Color(0xFFF28E1C)
                                    : const Color(0xFF24262B),
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 18.w,
                    ),
                    Divider(
                      height: 1.w,
                      color: const Color(0xFFECEEEF),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        )),
        BottomButtonWapper(
          cancel: () {
            updateSelection(false, 0);
          },
          submit: () {},
        )
      ],
    );
  }

  Widget _createSelection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: selectionList.map<Widget>((item) {
                // var itemList = [...item['typeList']];
                // if (item['typeList'].length > 6) {
                //   itemList.removeRange(6, item['typeList'].length);
                // }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.w),
                      child: Text(item['name']),
                    ),
                    Wrap(
                      children: item['typeList'].map<Widget>((e) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              item['typeList'][item['typeList'].indexOf(e)]
                                      ['selection'] =
                                  !item['typeList'][item['typeList'].indexOf(e)]
                                      ['selection'];
                              print(item['typeList']
                                  [item['typeList'].indexOf(e)]['selection']);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20.w, right: 20.w),
                            padding: EdgeInsets.fromLTRB(18.w, 5.w, 18.w, 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.w),
                                color: e['selection']
                                    ? const Color(0xFFFEF8ED)
                                    : const Color(0xFFF0F3F6)),
                            child: Text(
                              e['name'],
                              style: TextStyle(
                                color: e['selection']
                                    ? const Color(0xFFF28E1C)
                                    : const Color(0xFF24262B),
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 18.w,
                    ),
                    Divider(
                      height: 1.w,
                      color: const Color(0xFFECEEEF),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        )),
        BottomButtonWapper(
          cancel: () {
            updateSelection(false, 0);
          },
          submit: () {},
        )
      ],
    );
  }

  Widget _createBrand() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Wrap(
              children: tagList.map<Widget>((e) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      tagList[tagList.indexOf(e)]['selection'] =
                          !tagList[tagList.indexOf(e)]['selection'];
                      print(tagList[tagList.indexOf(e)]['selection']);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.w, right: 20.w),
                    padding: EdgeInsets.fromLTRB(18.w, 5.w, 18.w, 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        color: e['selection']
                            ? const Color(0xFFFEF8ED)
                            : const Color(0xFFF0F3F6)),
                    child: Text(
                      e['name'],
                      style: TextStyle(
                        color: e['selection']
                            ? const Color(0xFFF28E1C)
                            : const Color(0xFF24262B),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )),
        BottomButtonWapper(
          cancel: () {
            updateSelection(false, 0);
          },
          submit: () {},
        )
      ],
    );
  }

  Widget _createTag() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Wrap(
              children: tagList.map<Widget>((e) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      tagList[tagList.indexOf(e)]['selection'] =
                          !tagList[tagList.indexOf(e)]['selection'];
                      print(tagList[tagList.indexOf(e)]['selection']);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.w, right: 20.w),
                    padding: EdgeInsets.fromLTRB(18.w, 5.w, 18.w, 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        color: e['selection']
                            ? const Color(0xFFFEF8ED)
                            : const Color(0xFFF0F3F6)),
                    child: Text(
                      e['name'],
                      style: TextStyle(
                        color: e['selection']
                            ? const Color(0xFFF28E1C)
                            : const Color(0xFF24262B),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )),
        BottomButtonWapper(
          cancel: () {
            updateSelection(false, 0);
          },
          submit: () {},
        )
      ],
    );
  }

  Widget dropWapper() {
    return Container(
      width: 50.w,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.w),
          topRight: Radius.circular(8.w),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child:
                DropDownScreen(updateSelection: updateSelection, key: dropKey),
          )
        ],
      ),
    );
  }

  Widget initBg() {
    return XccBackDrop(
      height: 400.w,
      child: Image.network(
        'https://img-baofun.zhhainiao.com/market/semvideo/3fc6cdef4427e61be69096c6ebb59a1c_preview.jpg',
        width: double.infinity,
        height: 400.w,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget initTopTabbar() {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: Color.fromARGB(_opacity, 53, 56, 63),
      width: double.infinity,
      height: 30.w,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _tab.length,
        itemBuilder: (context, position) {
          var data = _tab[position];
          var isActive = position == currentPage;
          return InkWell(
            onTap: () {
              if (!isChangeEnd) return;
              isChangeEnd = false;
              Future.delayed(const Duration(milliseconds: 500), () {
                isChangeEnd = true;
              });
              if (currentPage == position) return;
              setState(() {
                currentPage = position;
              });
              /* 切换 */
              onPageChange(position, p: pageController);
              _tabbarController!.animateTo(position);
            },
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 1),
              width: currentPage == position ? 88.w : 72.w,
              height: 30.w,
              decoration: BoxDecoration(
                color: isActive ? Color(0xFFFFEAC2) : Color(0xFF3C3F44),
                borderRadius: BorderRadius.circular(30.w),
              ),
              margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
              child: Text(
                '$data',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: isActive ? Color(0xFF3C3F44) : Color(0xFFFFEAC2)),
              ),
            ),
          );
        },
      ),
    );
    // return Container(
    //   width: double.infinity,
    //   height: 50.w,
    //   // color:_isScrollTop? const Color(0xFF35383F):Colors.transparent,
    //   child: _is_show
    //       ? TabBar(
    //           indicatorWeight: 0,
    //           padding: EdgeInsets.all(0),
    //           indicator: BoxDecoration(
    //             color: const Color.fromARGB(255, 57, 227, 128),
    //             borderRadius: BorderRadius.circular(10.w),
    //           ),
    //           // indicatorPadding: EdgeInsets.fromLTRB(0.w, 4.w, 0.w, 4.w),
    //           isScrollable: true,
    //           controller: _tabbarController,
    //           tabs: _tab.map<Tab>(
    //             (e) {
    //               return Tab(
    //                 iconMargin: EdgeInsets.all(0),
    //                 child: Container(
    //                     width: 72.w,
    //                     color: Colors.red,
    //                     child: Center(
    //                       child: Text('$e'),
    //                     )),
    //               );
    //             },
    //           ).toList(),
    //         )
    //       : const SizedBox(),
    // );
  }

  Widget initTabIconScroll() {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: Color.fromARGB(_opacity, 53, 56, 63),
      width: double.infinity,
      height: 20.w,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _tab.length,
        itemBuilder: (context, position) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 1),
            width: currentPage == position ? 88.w : 72.w,
            height: 20.w,
            margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
            child: Container(
                alignment: Alignment.bottomCenter,
                child: currentPage == position
                    ? Image.asset(
                        'assets/images/tabbar_bottom_icon.png',
                        width: 48.w,
                        height: 12.w,
                      )
                    : SizedBox()),
          );
        },
      ),
    );
  }

  Widget initScroll() {
    return SizedBox(
      width: double.infinity,
      height: 140.w,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _tab.length,
        itemBuilder: (context, position) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: currentPage == position ? 88.w : 72.w,
                height: currentPage == position ? 88.w : 72.w,
                margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w)),
                child: InkWell(
                  onTap: () {
                    if (!isChangeEnd) return;
                    isChangeEnd = false;
                    Future.delayed(const Duration(milliseconds: 500), () {
                      isChangeEnd = true;
                    });
                    if (currentPage == position) return;
                    setState(() {
                      currentPage = position;
                    });
                    /* 切换 */
                    onPageChange(position, p: pageController);
                    _tabbarController!.animateTo(position);
                  },
                  child: Column(children: [Container()]),
                ),
              ),
              // Opacity(
              //     opacity: currentPage == position ? 1 : 0,
              //     child: Container(
              //       width: 20.w,
              //       height: 10.w,
              //       color: Colors.red,
              //     ))
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class BottomButtonWapper extends StatelessWidget {
  final Function cancel;
  final Function submit;
  const BottomButtonWapper(
      {Key? key, required this.cancel, required this.submit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.w,
      width: double.infinity,
      color: ThemeColor.c_ff,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
          onTap: () => cancel(),
          child: Container(
            width: 144.w,
            alignment: Alignment.center,
            height: 44.w,
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFDDE5E7),
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(22.w)),
            child: Text(
              '取消',
              style: TextStyle(fontSize: 18.sp, color: const Color(0xFF24262B)),
            ),
          ),
        ),
        SizedBox(
          width: 28.w,
        ),
        InkWell(
          onTap: () => cancel(),
          child: Container(
            alignment: Alignment.center,
            width: 144.w,
            height: 44.w,
            decoration: BoxDecoration(
                color: const Color(0xFFF8D179),
                border: Border.all(
                  color: const Color(0xFFF8D179),
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(22.w)),
            child: Text(
              '确定',
              style: TextStyle(fontSize: 18.sp, color: const Color(0xFF24262B)),
            ),
          ),
        ),
      ]),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  SliverDelegate({required this.child, this.extentHeight});

  final Widget child;
  final double? extentHeight;

  @override
  double get maxExtent => extentHeight ?? 50.w;

  @override
  double get minExtent => extentHeight ?? 50.w;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override //是否需要重建
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class FlavorGoodsCard extends StatefulWidget {
  const FlavorGoodsCard({Key? key}) : super(key: key);

  @override
  State<FlavorGoodsCard> createState() => _FlavorGoodsCardState();
}

class _FlavorGoodsCardState extends State<FlavorGoodsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160.w,
      margin: EdgeInsets.only(top: 12.w, left: 12.w, right: 12.w),
      padding: EdgeInsets.fromLTRB(12.w, 16.w, 12.w, 16.w),
      decoration: BoxDecoration(
          color: ThemeColor.c_ff, borderRadius: BorderRadius.circular(8.w)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CaCheImageWidget(
          '',
          width: 80.w,
          height: 80.w,
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
            child: Column(
          children: [
            Container(
              child: Row(children: [
                Expanded(
                  child: Text(
                    '你啊您爱上的男生断奶年天三顿饭i案上的男生断奶年天三顿饭i案上的男生断奶年天三顿饭i案上的男生断奶年天三顿饭i案发你是那份i安放',
                    maxLines: 2,
                    style: TextStyle(
                        color: ThemeColor.ayBlue,
                        fontSize: 16.sp,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Container(
                  width: 44.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF5F7F8),
                      borderRadius: BorderRadius.circular(8.w)),
                )
              ]),
            ),
            SizedBox(
              height: 42.w,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.only(top: 12.w, bottom: 12.w),
                scrollDirection: Axis.horizontal,
                children: _crateTags([1, 2, 3, 4, 5, 6, 7, 8]),
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 19.w, right: 19.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/zan_icon.png',
                        width: 16.w,
                        height: 16.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        '好喝',
                        style: TextStyle(
                            fontSize: 14.sp, color: ThemeColor.c_9),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(3.1415926535897932),
                        child: Image.asset(
                          'assets/images/zan_icon.png',
                          width: 16.w,
                          height: 16.w,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        '不好喝',
                        style: TextStyle(
                            fontSize: 14.sp, color: ThemeColor.c_9),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/zan_icon.png',
                        width: 16.w,
                        height: 16.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        '想试试',
                        style: TextStyle(
                            fontSize: 14.sp, color: ThemeColor.c_9),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ))
      ]),
    );
  }

  List<Widget> _crateTags(val) {
    List<Widget> list = [];
    for (var i = 0; i < val.length; i++) {
      var e = val[i];
      Widget widget = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 7.w),
        padding: EdgeInsets.only(left: 7.w, right: 7.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFCAFFFC), Color(0xFFA8FFFA)]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.w),
            bottomRight: Radius.circular(8.w),
          ),
        ),
        child: Text(
          '无敌美味',
          style: TextStyle(
            color: const Color(0xFF00918A),
            fontSize: 11.sp,
          ),
        ),
      );
      list.add(widget);
    }
    return list;
  }
}
