import 'package:flutter/material.dart';
import 'package:flutter_app/app/router/uni_router.dart';
import 'package:flutter_app/app/utils/themeData.dart';
import 'package:flutter_app/home_page/home.dart';
import 'package:flutter_app/user_page/pages/user_page.dart';

class NavgationPage extends StatefulWidget {
  const NavgationPage({Key? key}) : super(key: key);

  @override
  State<NavgationPage> createState() => _NavgationPageState();
}

class _NavgationPageState extends State<NavgationPage> {
  //页面控制器，初始 0
  final PageController _controller = PageController();

  // 禁止 PageView 滑动
  final ScrollPhysics _neverScroll = const NeverScrollableScrollPhysics();

  final NotchedShape shape = const CircularNotchedRectangle();

  int _currentPage = 0;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildSearchButton(context),
      body: PageView(
        physics: _neverScroll,
        controller: _controller,
        children: const [
          HomePage(),
          UserPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // 主页搜索按钮
  // 由于 按钮 颜色需要随 点击头部栏 状态而改变，
  // 使用 BlocBuilder 构建
  Widget _buildSearchButton(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      backgroundColor: const Color(0xff44D1FD),
      child: const Icon(Icons.search),
      onPressed: () => Navigator.of(context).pushNamed(UnitRouter.search),
    );
  }

  // 由于 bottomNavigationBar 颜色需要随 点击头部栏 状态而改变，
  // 使用 BlocBuilder 构建
  Widget _buildBottomNav(BuildContext context) => BottomAppBar(
        elevation: 0,
        shape: shape,
        notchMargin: 5,
        color: ThemeColor.dfnBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              color: _currentPage == 0 ? ThemeColor.pureWhite : ThemeColor.c_9,
              onPressed: () => _updateIndex(0),
            ),
            IconButton(
              icon: const Icon(Icons.people),
              color: _currentPage == 1 ? ThemeColor.pureWhite : ThemeColor.c_9,
              onPressed: () => _updateIndex(1),
            )
          ],
        ),
      );

  void _updateIndex(val) {
    _controller.jumpToPage(val);
    setState(() {
      _currentPage = val;
    });
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }
}
