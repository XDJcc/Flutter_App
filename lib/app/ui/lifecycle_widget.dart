import 'package:flutter/material.dart';

class LifecycleWidget extends StatefulWidget {
  final WidgetBuilder builder;
  final VoidCallback? initState;
  final VoidCallback? dispose;

  const LifecycleWidget(
      {Key? key, required this.builder, this.initState, this.dispose})
      : super(key: key);

  @override
  State<LifecycleWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.initState != null) {
      widget.initState!();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.dispose != null) {
      widget.dispose!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
