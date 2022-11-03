import 'package:flutter/material.dart';
import 'package:flutter_app/app/ui/base_controller.dart';

import 'package:provider/provider.dart';
import 'package:flutter_app/app/ui/lifecycle_widget.dart';

abstract class BasePage<T extends BaseController> extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  bool get wantKeepAlive => false;

  bool get observeKeyboard => false;

  T create(BuildContext context);

  Widget buildWidget(BuildContext context, T controller);

  void initState() {}

  void dispose() {}

  Future<bool> onWillPop(BuildContext context, T controller) async {
    return true;
  }

  //observeKeyboard返回为true的时候才会调用这个方法
  void keyboardShowOrHide(
      BuildContext context, bool show, double keyboardHeight) {}

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: create,
      child: Builder(
        builder: (cxt) {
          final controller = cxt.read<T>();
          return WillPopScope(
            onWillPop: () async {
              final result = await onWillPop(context, controller);
              return result;
            },
            child: _InternalWidget<T>(
              wantKeepAlive: wantKeepAlive,
              observeKeyboard: observeKeyboard,
              initState: initState,
              dispose: dispose,
              widgetBuilder: buildWidget,
              keyboardCallback: keyboardShowOrHide,
            ),
          );
        },
      ),
    );
  }
}

typedef BaseWidgetBuilder<T> = Widget Function(
    BuildContext context, T controller);
typedef KeyboardCallback<T> = void Function(
    BuildContext context, bool show, double keyboardHeight);

class _InternalWidget<T extends BaseController> extends StatefulWidget {
  final bool observeKeyboard;
  final bool wantKeepAlive;
  final BaseWidgetBuilder<T> widgetBuilder;
  final KeyboardCallback<T> keyboardCallback;
  final VoidCallback initState;
  final VoidCallback dispose;

  const _InternalWidget(
      {Key? key,
      required this.observeKeyboard,
      required this.wantKeepAlive,
      required this.widgetBuilder,
      required this.keyboardCallback,
      required this.initState,
      required this.dispose})
      : super(key: key);

  @override
  State<_InternalWidget> createState() => _InternalWidgetState<T>();
}

class _InternalWidgetState<T extends BaseController>
    extends State<_InternalWidget>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    if (widget.observeKeyboard) {
      WidgetsBinding.instance.addObserver(this);
    }
    widget.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.observeKeyboard) {
      WidgetsBinding.instance.removeObserver(this);
    }
    widget.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final viewInsets = MediaQuery.of(context).viewInsets;
      if (viewInsets.bottom == 0) {
        widget.keyboardCallback(context, false, 0);
      } else {
        widget.keyboardCallback(context, true, viewInsets.bottom);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = context.read<T>();
    return LifecycleWidget(initState: () {
      controller.setupArguments(ModalRoute.of(context)?.settings.arguments);
      controller.onInit();
    }, builder: (context) {
      return widget.widgetBuilder(context, controller);
    });
  }

  @override
  bool get wantKeepAlive => widget.wantKeepAlive;
}
