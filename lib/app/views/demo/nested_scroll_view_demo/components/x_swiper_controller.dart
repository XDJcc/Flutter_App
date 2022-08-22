/// create by XDJcc 2022-8-19
/// contact me by email 2045659302@qq.com
///说明：重写swipercontroller 添加自定义方法 tonext 自定义滚动方向
import 'package:card_swiper/card_swiper.dart';

class XccSwiperController extends SwiperController {
  XccSwiperController();

  Future toNext({bool animation = true}) {
    final e = event = XccPrevIndexControllerEvent(animation: animation);
    notifyListeners();
    return e.future;
  }

}

class XccPrevIndexControllerEvent extends IndexControllerEventBase
    with TargetedPositionControllerEvent, StepBasedIndexControllerEvent {
  XccPrevIndexControllerEvent({
    required bool animation,
  }) : super(
          animation: animation,
        );
  @override
  int get step => 1;

  @override
  double get targetPosition => -1;
}