import 'package:camera/camera.dart';
import 'package:flutter_app/app/models/user_info_model.dart';

class GlobalData {
  /* 登录的用户id */
  static String userId = "";
  static UserInfo userInfo = UserInfo(
      id: '',
      nickName: '',
      picture: '',
      mobile: '',
      token: '',
      reInterestTag: false);

  /* 极光推送设备唯一码 */
  static String registrationId = "";

  /* 当前版本号 */
  static String version = "";

  /* 构建版本号 */
  static String iosBuildVersion = '';

  /* 设备信息 */
  static Map deviceInfo = {};

  /* 相机设备 */
  static List<CameraDescription> cameras = [];

  /* 当前的ip */
  static String ipAddress = "";
}
