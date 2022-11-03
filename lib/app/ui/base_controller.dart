import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

T? _ambiguate<T>(T? value) => value;

abstract class BaseController extends ChangeNotifier {
  /// 防止页面销毁后,异步任务才完成,导致报错
  bool _disposed = false;

  ///防止在dispose没有将Loading组件dismiss掉
  bool _isLoading = false;

  ///Navigator.push传递的参数
  Object? _arguments;

  Object? get arguments => _arguments;

//*************************生命周期**************************
  void setupArguments(Object? arguments) {
    _arguments = arguments;
  }

  @mustCallSuper
  void onInit() {
    _ambiguate(SchedulerBinding.instance)
        ?.addPostFrameCallback((_) => onReady());
  }

  @protected
  void onReady() {}

  @override
  void dispose() {
    _disposed = true;
    if (_isLoading) {
      stopLoading(animation: false);
    }
    super.dispose();
  }

  //****************************************************************
  @mustCallSuper
  void startLoading() {
    _isLoading = true;
  }

  @mustCallSuper
  void stopLoading({bool animation = true}) {
    _isLoading = true;
  }

  //防止Future事件未完成前就退出，导致的报错
  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  //****************************Debug***************************
  /// [e]为错误类型 :可能为 Error , Exception ,String
  /// [s]为堆栈信息
  /// [message]为描述信息
  void printErrorStack(e, s, {String? message}) {
    debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----error-----↓↓↓↓↓↓↓↓↓↓----->
$e
<-----↑↑↑↑↑↑↑↑↑↑-----error-----↑↑↑↑↑↑↑↑↑↑----->''');
    if (s != null) {
      debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----trace-----↓↓↓↓↓↓↓↓↓↓----->
$s
<-----↑↑↑↑↑↑↑↑↑↑-----trace-----↑↑↑↑↑↑↑↑↑↑----->
    ''');
    }
    if (message != null) {
      debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----trace-----↓↓↓↓↓↓↓↓↓↓----->
$message
<-----↑↑↑↑↑↑↑↑↑↑-----trace-----↑↑↑↑↑↑↑↑↑↑----->
    ''');
    }
  }
}
