/// create by XDJcc 2022-8-19
/// contact me by email 2045659302@qq.com
///说明：

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_flutter/app/components/IAppbar.dart';
import 'package:study_flutter/app/router/uni_router.dart';
import 'package:study_flutter/app/utils/themeData.dart';

class DemoListPage extends StatefulWidget {
  const DemoListPage({Key? key}) : super(key: key);

  @override
  State<DemoListPage> createState() => _DemoListState();
}

class _DemoListState extends State<DemoListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IAppBar(
        child: AppBar(
          title: const Text(
            'DemoListPage',
          ),
        ),
      ),
      body: Container(
        height: 800.w,
        width: 400.w,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                // margin: EdgeInsets.all(20.w),
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  color: ThemeColor.c_ff,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Ink(
                  child: InkWell(onTap: () {
                    Navigator.of(context)
                        .pushNamed(UnitRouter.nested_scroll_view_demo);
                  }),
                )
                );
          },
        ),
      ),
    );
  }
}
