/// create by XDJcc 2022-8-19
/// contact me by email 2045659302@qq.com
///说明：

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_flutter/app/components/costomized/IAppbar.dart';
import 'package:study_flutter/app/router/uni_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
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
              },
              child: SizedBox(
                width: 100.w,
                height: 100.w,
                child: Text(
                  'I am HomePage',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
