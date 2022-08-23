import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_flutter/app/components/bruno_extend/x_brn_expand_able_text.dart';
import 'package:study_flutter/app/components/cached_network_image/cached_network_image.dart';
import 'package:study_flutter/app/utils/themeData.dart';

class GoodsDetailList extends StatefulWidget {
  final int activeCatId; //当前选择的栏目ID
  const GoodsDetailList(
    this.activeCatId, {
    Key? key,
  }):super(key: key);

  @override
  State<GoodsDetailList> createState() => _GoodsDetailListState();
}
class _GoodsDetailListState extends State<GoodsDetailList>
    with AutomaticKeepAliveClientMixin {
  static const loadingTag = "##loading##"; //表尾标记
  List _buildArticleList = [loadingTag]; //  数据列表
  bool _isOver = true; // 接口请求 防抖
  int _page = 1; //当前的页数
  bool _haveMore = true; //是否有更多的数据

  Widget contentWidget = Container(
    alignment: Alignment.center,
  );
  @override
  void initState() {
    super.initState();
    _buldContent();
    // getListViewList();
  }

  printA() {
    print('aaaaaaaaaaaaaaaaaaaaaaaa');
  }

  // 加载更多 数据
  void getListViewList() async {
    if (!_isOver) return;
    _isOver = false;
    if (_haveMore) {
      // var userId = await LocalStorage.get(LocalStorage.userId);
      var result = [];
      // = await HomeRequest.getArticleList({
      //   'userId': userId,
      //   'articleCatId': widget.activeCatId,
      //   'pageSize': 20,
      //   'pageNum': _page
      // });
      _isOver = true;
      if (mounted) {
        setState(() {
          _buildArticleList.insertAll(_buildArticleList.length - 1, result);
          if (result.length == 20) {
            _page++;
          } else if (result.length < 20) {
            _haveMore = false;
          }
        });
        _buldContent();
      }
    }
  }

  void initList() async {
    await Future.value(true);

    setState(() {
      _buildArticleList = [loadingTag]; // 瀑布留 数据列表
      _isOver = true; // 接口请求 防抖
      _page = 1; //当前的页数
      _haveMore = true;
    });

    getListViewList();
  }

  _buldContent() {
    Widget list;
    if (_buildArticleList.length > 2) {
      list = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: Colors.white,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/look_compared_no_goods.png',
                  width: 316.w,
                  height: 194.w,
                ),
              ),
              Text(
                '找不到内容',
                style: TextStyle(fontSize: 16.sp, color: Color(0xFFB3BBBD)),
              ),
              SizedBox(
                height: 8.w,
              ),
            ]),
      );
    } else {
      list = SafeArea(
        top: false,
        bottom: false,
        child: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return  GoodsDetailCard(index);
                    },
                    childCount: 100,
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    setState(() {
      contentWidget = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用
    return contentWidget;
  }

  @override
  bool get wantKeepAlive => true; // 是否需要缓存

  @override
  void dispose() {
    super.dispose();
  }
}

class GoodsDetailCard extends StatefulWidget {
  final index;
  const GoodsDetailCard(this.index, {Key? key}) : super(key: key);

  @override
  State<GoodsDetailCard> createState() => _GoodsDetailCardState();
}

class _GoodsDetailCardState extends State<GoodsDetailCard> {
  late final index;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          color: ThemeColor.c_ff, borderRadius: BorderRadius.circular(12.w)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$index'),
                      CaCheImageWidget(
                          'https://img2.baidu.com/it/u=3371268082,3224164670&fm=253&fmt=auto&app=138&f=PNG?',
                          width: 100.w,
                          height: 100.w,
                          fit: BoxFit.cover,
                          cornerRadius: 8.w),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 188.w,
                                child: Text(
                                  '哦沙发沙发是的那份送饭哦是佛懂佛山农夫你送佛山弄',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: ThemeColor.c_3,
                                      fontSize: 16.sp,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 4.w,
                              ),
                              Text(
                                '上市时间：22年9月',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: ThemeColor.c_3,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.clip),
                              ),
                              SizedBox(
                                width: 250.w,
                                child: XccBrnExpandableText(
                                    text:
                                        '冠寓是龙湖地产的第三大主航道业务，专注做中高端租赁市场，标语是我家我自在；门店位于昌平区390号，距离昌平线生命科学冠寓是龙湖地产的第三大主航道业务，专注做中高端租赁市场，标语是我家我自在标语是我家我自在。',
                                    maxLines: 2,
                                    flodStyle: TextStyle(
                                        height: 2,
                                        color: ThemeColor.c_9,
                                        fontSize: 12.sp),
                                    onExpanded: (bool isExpanded) {
                                      if (isExpanded) {
                                        debugPrint('已经展开');
                                      } else {
                                        debugPrint('已经收起');
                                      }
                                    }),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
              SizedBox(height: 12.w),
              Divider(
                height: 1,
                color: ThemeColor.colorLine,
              ),
              SizedBox(height: 12.w),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 19.w, right: 19.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
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
                    ),
                    Container(
                      child: Row(
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
                    ),
                    Container(
                      child: Row(
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
                    ),
                  ],
                ),
              )
            ],
          )),
          Positioned(
            top: -8.w,
            right: -12.w,
            width: 79.w,
            height: 42.w,
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColor.c_f5,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(21.w),
                  bottomLeft: Radius.circular(21.w),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/xing_collect_icon.png',
                              width: 12.w,
                              height: 12.w,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              '查看',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ThemeColor.c_3,
                              ),
                            )
                          ],
                        ),
                        Text(
                          '感官评分',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ThemeColor.c_3,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: ThemeColor.c_3,
                  ),
                  SizedBox(
                    width: 2.w,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
