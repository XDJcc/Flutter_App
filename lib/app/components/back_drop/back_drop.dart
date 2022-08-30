import 'dart:ui';

import 'package:flutter/material.dart';

/// XDJcc back drop
/// @time 22-8-30
///
/// @说明  毛玻璃组件
///

class XccBackDrop extends StatelessWidget {
  const XccBackDrop({
    Key? key,
    required this.child,
    this.sigmaX = 10.0,
    this.sigmaY = 10.0,
    this.opacity = 0.4,
    this.width = double.infinity,
    this.height = double.infinity,
  }) : super(key: key);

  final Widget child;
  final double sigmaX;
  final double sigmaY;
  final double opacity;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(children: [
        child,
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SizedBox(width: width, height: height),
        ),
      ]),
    );
  }
}
