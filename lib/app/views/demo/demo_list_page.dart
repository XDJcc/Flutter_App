/// create by XDJcc 2022-8-19
/// contact me by email 2045659302@qq.com
///说明：

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_flutter/app/components/costomized/IAppbar.dart';
import 'package:study_flutter/app/router/uni_router.dart';
import 'package:study_flutter/app/utils/themeData.dart';
import 'package:study_flutter/app/views/demo/models/demo_list_model.dart';

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

  final List<DemoListDetail> dateList = [
    DemoListDetail.fromJson({
      "title": 'NestedScrollViewDemoPage',
      "pages": UnitRouter.nested_scroll_view_demo,
    }),
    DemoListDetail.fromJson({
      "title": 'SliverPersistentHeaderDemoPage',
      "pages": UnitRouter.sliver_persistent_header_demo_page,
    }),
    DemoListDetail.fromJson({
      "title": 'LookForFlavorPage',
      "pages": UnitRouter.look_for_flavor_page,
    }),
  ];

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
        color: ThemeColor.c_f5,
        child: ListView.builder(
          itemCount: dateList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 0),
                height: 100.w,
                decoration: BoxDecoration(
                  color: ThemeColor.c_ff,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Ink(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(dateList[index].pages ?? '');
                    },
                    child: Center(child: Text(dateList[index].title ?? '')),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
