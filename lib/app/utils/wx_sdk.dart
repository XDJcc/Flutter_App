import 'dart:io';
import 'dart:typed_data';
import 'package:fluwx/fluwx.dart';
import 'package:flutter_app/app/config/config.dart';

class WxSdk {
  // static bool wxIsInstalled;
  static Future init() async {
    registerWxApi(
      appId: Config.APPID,
      doOnAndroid: true,
      doOnIOS: true,
      universalLink: Config.universalLink,
    );
  }

  static Future<bool> wxIsInstalled() async {
    return await isWeChatInstalled;
  }

  /// 分享图片到微信，
  /// file=本地路径
  /// url=网络地址
  /// asset=内置在app的资源图片
  /// scene=分享场景，1好友会话，2朋友圈，3收藏
  static void ShareImage(
      {String? title,
      String? decs,
      String? file,
      String? url,
      String? asset,
      int scene = 1}) async {
    WeChatScene wxScene = WeChatScene.SESSION;
    if (scene == 2) {
      wxScene = WeChatScene.TIMELINE;
    } else if (scene == 3) {
      wxScene = WeChatScene.FAVORITE;
    }
    WeChatShareImageModel? model = null;

    if (file != null) {
      model = WeChatShareImageModel(WeChatImage.file(File(file)),
          title: title, description: decs, scene: wxScene);
    } else if (url != null) {
      model = WeChatShareImageModel(WeChatImage.network(url),
          title: title, description: decs, scene: wxScene);
    } else if (asset != null) {
      model = WeChatShareImageModel(WeChatImage.asset(asset),
          title: title, description: decs, scene: wxScene);
    } else {
      throw Exception("缺少图片资源信息");
    }
    shareToWeChat(model);
  }

  /// 分享文本
  /// content=分享内容
  /// scene=分享场景，1好友会话，2朋友圈，3收藏
  static void ShareText(String content, {String? title, int scene = 1}) {
    WeChatScene wxScene = WeChatScene.SESSION;
    if (scene == 2) {
      wxScene = WeChatScene.TIMELINE;
    } else if (scene == 3) {
      wxScene = WeChatScene.FAVORITE;
    }
    WeChatShareTextModel model =
        WeChatShareTextModel(content, title: title, scene: wxScene);
    shareToWeChat(model);
  }

// ignore: slash_for_doc_comments
/***
 * 分享视频
 * videoUrl=视频网上地址
 * thumbFile=缩略图本地路径
   * scene=分享场景，1好友会话，2朋友圈，3收藏
 */
  static void ShareVideo(String videoUrl,
      {String? thumbFile, String? title, String? desc, int scene = 1}) {
    WeChatScene wxScene = WeChatScene.SESSION;
    if (scene == 2) {
      wxScene = WeChatScene.TIMELINE;
    } else if (scene == 3) {
      wxScene = WeChatScene.FAVORITE;
    }
    WeChatImage? image = null;
    if (thumbFile != null) {
      image = WeChatImage.file(File(thumbFile));
    }
    var model = WeChatShareVideoModel(
        videoUrl: videoUrl,
        thumbnail: image,
        title: title,
        description: desc,
        scene: wxScene);
    shareToWeChat(model);
  }

  /// 分享链接
  /// url=链接
  /// thumbFile=缩略图本地路径
  /// scene=分享场景，1好友会话，2朋友圈，3收藏
  /// 本地图片试了不行，暂时只支持线上图片，即传入networkThumb
  static void ShareUrl(String url,
      {String? thumbFile,
      Uint8List? thumbBytes,
      String? title,
      String? desc,
      int scene = 1,
      String? networkThumb,
      String? assetThumb}) {
    desc = desc ?? "";
    title = title ?? "";
    if (desc.length > 54) {
      desc = desc.substring(0, 54) + "...";
    }
    if (title.length > 20) {
      title = title.substring(0, 20) + "...";
    }
    WeChatScene wxScene = WeChatScene.SESSION;
    if (scene == 2) {
      wxScene = WeChatScene.TIMELINE;
    } else if (scene == 3) {
      wxScene = WeChatScene.FAVORITE;
    }
    WeChatImage? image;
    if (thumbFile != null) {
      image = WeChatImage.file(File(thumbFile));
    } else if (thumbBytes != null) {
      image = WeChatImage.binary(thumbBytes);
    } else if (networkThumb!.isNotEmpty) {
      image = WeChatImage.network(networkThumb);
    } else if (assetThumb!.isNotEmpty) {
      image = WeChatImage.asset(assetThumb, suffix: ".png");
    }
    var model = WeChatShareWebPageModel(
      url,
      thumbnail: image,
      title: title,
      description: desc,
      scene: wxScene,
    );
    shareToWeChat(model);
  }
}
