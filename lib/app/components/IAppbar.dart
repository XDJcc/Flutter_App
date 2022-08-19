import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IAppBar extends StatefulWidget implements PreferredSizeWidget {
  AppBar child = AppBar();
  double? contentHeight;
  IAppBar({required this.child, this.contentHeight, Key? key})
      : super(key: key);

  @override
  State<IAppBar> createState() => _IAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(contentHeight ?? 50.w);
}

class _IAppBarState extends State<IAppBar> {
  late AppBar child;
  @override
  void initState() {
    super.initState();
    child = widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
