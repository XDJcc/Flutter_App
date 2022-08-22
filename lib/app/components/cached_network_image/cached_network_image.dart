
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CaCheImageWidget extends StatelessWidget {
  String url = "";
  double? width;
  double? height;

  double? marginLeft = 0;
  double? marginRight = 0;
  double? marginTop = 0;
  double? marginBottom = 0;
  double? cornerRadius = 0;
  double? margin = 0;
  double? borderWidth = 0;
  Color? borderColor = Colors.transparent;
  bool? isCircle = false;
  Color? backgroundColor = Colors.transparent;
  VoidCallback? onClick;
  /* 默认图片的占位符 */
  String? placeholderImageUrl;
  /* 加载错误的占位符 */
  String? errorImageUrl;

  BoxFit? fit;

  bool? noPlaceholder = false;

  CaCheImageWidget(this.url,
      {Key? key,
      this.width,
      this.height,
      this.marginBottom,
      this.marginRight,
      this.marginTop,
      this.marginLeft,
      this.margin,
      this.cornerRadius,
      this.isCircle,
      this.borderColor,
      this.fit,
      this.borderWidth,
      this.backgroundColor,
      this.onClick,
      this.placeholderImageUrl,
      this.noPlaceholder,
      this.errorImageUrl})
      : super(key: key) {
    if (margin != null) {
      if (margin != null && margin! > 0) {
        marginLeft = margin;
        marginTop = margin;
        marginRight = margin;
        marginBottom = margin;
      }
    }

    if (isCircle != null) {
      if (isCircle ?? true) {
        cornerRadius = width ?? 0 / 2;
      }
    }

    // ignore: unrelated_type_equality_checks
    if (onClick == Null) {
      onClick = () {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.fromLTRB(marginLeft ?? 0, marginTop ?? 0,
            marginRight ?? 0, marginBottom ?? 0),
        decoration: BoxDecoration(
          border: Border.all(
              width: borderWidth ?? 0,
              color: borderColor ?? Colors.transparent),
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? 0)),
        ),
        child: InkWell(
          onTap: onClick,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(cornerRadius ?? 0),
              child: getImage()),
        ));
  }

  Widget getImage() {
    if (url == "") {
      return Image.asset(
        placeholderImageUrl ?? 'assets/images/empty_good.png',
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
    } else if (url.startsWith("http") || url.startsWith("https")) {
      //网络图片
      return CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        placeholder: noPlaceholder == true
            ? null
            : (context, url) => placeholderImageUrl == null
                ? Image.asset(
                    'assets/images/image_loading.png',
                    width: width,
                    height: height,
                  )
                : Image.asset(
                    placeholderImageUrl!,
                    width: width,
                    height: height,
                  ),
        errorWidget: (context, url, error) => errorImageUrl == null
            ? Image.asset(
                'assets/images/empty_good.png',
                width: width,
                height: height,
              )
            : Image.asset(
                errorImageUrl!,
                width: width,
                height: height,
              ),
      );
    } else if (url.startsWith("assets")) {
      //项目内图片
      return Image.asset(url,
          width: width, height: height, fit: fit ?? BoxFit.contain);
    } else {
      //加载手机里面的图片
      // return Image.file(File(url),
      //     width: width, height: height, fit: BoxFit.cover);

      return Image.asset(
        placeholderImageUrl ?? 'assets/images/empty_good.png',
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
    }
  }
}
