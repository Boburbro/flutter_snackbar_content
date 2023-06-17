import 'package:flutter/material.dart';
import 'package:flutter_snackbar_content/src/assets_paths.dart';
import 'package:flutter_snackbar_content/src/content_types.dart';
import 'package:flutter_svg/svg.dart';

class FlutterSnackbarContent extends StatelessWidget {
  /// `IMPORTANT NOTE` for SnackBar properties before putting this in `content`
  /// backgroundColor: Colors.transparent
  /// behavior: SnackBarBehavior.floating
  /// elevation: 0.0
  /// /// `IMPORTANT NOTE` for MaterialBanner properties before putting this in `content`
  /// backgroundColor: Colors.transparent
  /// forceActionsBelow: true,
  /// elevation: 0.0
  /// [inMaterialBanner = true]

  /// message String is the body message which shows only 2 lines at max
  final String message;

  /// `optional` color of the SnackBar/MaterialBanner body
  final Color? color;

  /// contentType will reflect the overall theme of SnackBar/MaterialBanner: failure, success, help, warning
  final ContentType contentType;

  /// if you want to use this in materialBanner
  final bool inMaterialBanner;

  /// if you want to customize the font size of the title
  final double? titleFontSize;

  /// if you want to customize the font size of the message
  final double? messageFontSize;

  const FlutterSnackbarContent({
    Key? key,
    this.color,
    this.titleFontSize,
    this.messageFontSize,
    required this.message,
    required this.contentType,
    this.inMaterialBanner = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    final size = MediaQuery.of(context).size;

    // screen dimensions
    bool isMobile = size.width <= 768;
    bool isTablet = size.width > 768 && size.width <= 992;

    double horizontalPadding = 0.0;
    double leftSpace = size.width * 0.12;
    double rightSpace = size.width * 0.12;

    if (isMobile) {
      horizontalPadding = size.width * 0.01;
    } else if (isTablet) {
      leftSpace = size.width * 0.05;
      horizontalPadding = size.width * 0.2;
    } else {
      leftSpace = size.width * 0.05;
      horizontalPadding = size.width * 0.3;
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      ),
      padding: EdgeInsets.only(
        left: isRTL ? size.width * 0.04 : leftSpace,
        right: isRTL ? rightSpace : size.width * 0.04,
        top: size.height * 0.015,
        bottom: size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: color ?? contentType.color,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// content
          /// `message` body text parameter
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: messageFontSize ?? size.height * 0.016,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.01,
          ),
          InkWell(
            onTap: () {
              if (inMaterialBanner) {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                return;
              }
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: SvgPicture.asset(
              AssetsPath.close,
              height: size.height * 0.022,
              package: 'flutter_snackbar_content',
            ),
          ),
        ],
      ),
    );
  }
}
