enum AppNetworkEnv { product, internal, testDev, test }

extension BaseURL on AppNetworkEnv {
  String get basePath {
    switch (this) {
      case AppNetworkEnv.product:
        return 'https://fwy-prod.iyuetiao.com';
      case AppNetworkEnv.internal:
        return 'http://10.0.0.123:81';
      case AppNetworkEnv.testDev:
        return 'https://fengweiyun.iyuetiao.com';
      case AppNetworkEnv.test:
        return 'https://61.152.127.11';
    }
  }
}

class Config {
  /// //////////////////////////////////////常量////////////////////////////////////// ///
  static const LOCALE = "locale";

  /* 项目的appId */
  static const APPID = "wx010b7698ca7dc3e5";

  /* ios要用到的 */
  static const universalLink = "https://fengweiyun.iyuetiao.com/app/";

  //切换环境只需要修改这里
  static const AppNetworkEnv _env = AppNetworkEnv.testDev;

  static String get BASE_URL {
    return '${_env.basePath}/community-app-api/v1';
  }

  static String get BASE_IP {
    return '${_env.basePath}/get_ip';
  }
}
