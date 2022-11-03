import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  static const String TAG = '==lifecycle_event_handler==';
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;

  LifecycleEventHandler({
    required this.resumeCallBack,
    required this.suspendingCallBack,
  });

  @override
  void initState() {
    //  super.initState();
    //  _lastSize = WidgetsBinding.instance!.window.physicalSize;
    print("================================进入");
  }

  @override
  Future<Null> didChangeAppLifecycleState(AppLifecycleState state) async {
    print("state=============" + state.toString());
    switch (state) {
      case AppLifecycleState.inactive:
        //  应用程序处于闲置状态并且没有收到用户的输入事件。
        print('YM----->AppLifecycleState.inactive');
        /* 切换到后台，不可见的情况 */
        break;
      case AppLifecycleState.paused:
//      应用程序处于不可见状态
        print('YM----->AppLifecycleState.paused');

        break;
      case AppLifecycleState.resumed:
        await resumeCallBack();
        //    进入应用时候不会触发该状态
        //  应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume。
        print('YM----->AppLifecycleState.resumed');
        break;
      case AppLifecycleState.detached:
        //当前页面即将退出
        await suspendingCallBack();
        print('YM----->AppLifecycleState.detached');
        break;
    }
  }

  @override
  Future<bool> didPopRoute() {
    /* 关闭当前页面 */
    // BehaviorRecord.popPageBehavior();

    print('YM--------didPopRoute'); //页面弹出
    return Future.value(false); //true为拦截，false不拦截
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('YM--------PushRoute');
    return Future.value(true);
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    print('YM--------didPushRouteInformation');
    return Future.value(true);
  }
}
