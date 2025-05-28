import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentStyle {
  static EdgeInsetsGeometry contentLargePadding =
      EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h);

  static EdgeInsetsGeometry contentSmallPadding =
      EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h);

  static EdgeInsetsGeometry contentExtraSmallPadding =
      EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h);

  static BoxDecoration contentBoxDecoration = BoxDecoration(
      color: ThemeColor.mainThemeLightColorFour,
      border: Border(
          top: BorderSide(color: ThemeColor.lightGrey),
          left: BorderSide(color: ThemeColor.lightGrey),
          right: BorderSide(color: ThemeColor.lightGrey)),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ));
}
