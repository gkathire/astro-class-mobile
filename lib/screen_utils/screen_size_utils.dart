import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenSizeUtils {
  static EdgeInsetsGeometry smallPaddingForWidth(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width * 0.03;
    return EdgeInsets.fromLTRB(screenSize, 10.h, screenSize, 10.h);
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
