/* NestedSliversPage slivers 吸顶滚动测试 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NestedSliversPage extends StatefulWidget {
  const NestedSliversPage({Key? key}) : super(key: key);

  @override
  State<NestedSliversPage> createState() => _NestedSliversPageState();
}

class _NestedSliversPageState extends State<NestedSliversPage>
    with SingleTickerProviderStateMixin {
  final _tab = ['张三', '李四', '王二', '麻子', '八戒'];

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tab.length,
      animationDuration: const Duration(milliseconds: 100),
      vsync: this,
      initialIndex: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              _buildTopContianer(size),
              _buildTab(size),
            ];
          },
          body: _buildTabBarView(size),
        ),
      ),
    );
  }

  Widget _buildTopContianer(Size size) {
    return SliverToBoxAdapter(
      child: Container(
        width: size.width,
        height: 200.w,
        color: const Color.fromARGB(255, 75, 75, 75),
      ),
    );
  }

  Widget _buildTab(Size size) {
    return Builder(
      builder: ((context) {
        return SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverPersistentHeader(
            pinned: true,
            delegate: SliverDelegate(
                extent: 150.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: size.width,
                      height: 50.w,
                      color: const Color.fromARGB(255, 160, 212, 238),
                    ),
                    Container(
                      width: size.width,
                      height: 50.w,
                      color: const Color.fromARGB(255, 160, 238, 207),
                    ),
                    Container(
                      width: size.width,
                      height: 50.w,
                      color: Colors.amber.withOpacity(0.6),
                      child: Row(children: [
                        TabBar(
                            isScrollable: true,
                            padding: const EdgeInsets.all(0),
                            controller: _tabController,
                            tabs: _tab.map((e) {
                              return Text(
                                e,
                                style: const TextStyle(color: Colors.black),
                              );
                            }).toList()),
                      ]),
                    ),
                  ],
                )),
          ),
        );
      }),
    );
  }

  Widget _buildTabBarView(Size size) {
    return TabBarView(
      controller: _tabController,
      children: _tab.map((e) {
        return Builder(
          builder: ((context) {
            return CustomScrollView(
              key: PageStorageKey<String>(e),
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(0.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Container(
                        width: size.width,
                        height: 100.w,
                        margin: EdgeInsets.all(20.w),
                        color: const Color.fromARGB(255, 236, 250, 167),
                        child: Center(
                          child: Text('$e --- $index'),
                        ),
                      );
                    }, childCount: 40),
                  ),
                ),
              ],
            );
          }),
        );
      }).toList(),
    );
  }
}

/* sliver自定义高度的 SliverDelegate */
class SliverDelegate extends SliverPersistentHeaderDelegate {
  SliverDelegate({required this.child, this.extent});

  final Widget child;

  final double? extent;

  @override
  double get maxExtent => extent ?? 50.w;

  @override
  double get minExtent => extent ?? 50.w;

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
