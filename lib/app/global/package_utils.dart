import 'package:package_info_plus/package_info_plus.dart';

abstract class PackageUtils {
  static late PackageInfo _packageInfo;

  ///在使用之前必须初始化
  static Future initPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  /// 应用名称.  iOS中的`CFBundleDisplayName`, Android中的`application/label`.
  static String get appName => _packageInfo.appName;

  /// 包名. iOS中的 bundleIdentifier`, Android中的`getPackageName`.
  static String get packageName => _packageInfo.packageName;

  /// 包版本. iOS中的`CFBundleShortVersionString`, Android中的`versionName`.
  static String get version => _packageInfo.version;

  /// 构建版本. iOS中的`CFBundleVersion` on iOS, Android中的`versionCode`.
  static String get buildNumber => _packageInfo.buildNumber;

  /// 应用签名. iOS中未空字符串, Android上的签名密钥签名（十六进制）.
  static String get buildSignature => _packageInfo.buildSignature;
}
