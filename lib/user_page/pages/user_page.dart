/// create by XDJcc 2022-8-19
/// contact me by email 2045659302@qq.com
///说明：

import 'package:flutter/material.dart';
import 'package:flutter_app/app/components/costomized/IAppbar.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
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
            'UserPage',
          ),
        ),
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              // Navigator.of(context)
              //     .pushNamed('/splash', arguments: {'name': 'XDJcc'});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('I am UserPage'),
              ],
            )),
      ),
    );
  }
}
