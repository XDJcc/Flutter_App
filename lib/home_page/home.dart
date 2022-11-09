/// create by XDJcc 2022-8-19
/// contact me by email 2045659302@qq.com
///说明：

import 'package:flutter/material.dart';
import 'package:flutter_app/app/ui/base_page.dart';
import 'package:flutter_app/home_page/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/app/components/costomized/IAppbar.dart';
import 'package:flutter_app/app/router/uni_router.dart';
import 'package:provider/provider.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({super.key});

  @override
  HomeController create(BuildContext context) {
    return HomeController();
  }

  @override
  Widget buildWidget(BuildContext context, HomeController controller) {
    HomeController c = context.read<HomeController>();
    return Scaffold(
      appBar: IAppBar(
        child: AppBar(
          title: const Text(
            'HomePage',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                // Navigator.of(context)
                //     .pushNamed('/splash', arguments: {'name': 'XDJcc'});
                Navigator.of(context).pushNamed(UnitRouter.demo_list);
                // Navigator.of(context).pushNamed(UnitRouter.login);
              },
              child: SizedBox(
                width: 100.w,
                height: 100.w,
                child: Center(
                  child: Text(
                    'I am HomePage',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
