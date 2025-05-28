import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ButtonStyle submitButtonStyle() {
  return TextButton.styleFrom(
      backgroundColor: ThemeColor.mainThemeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: ThemeColor.mainThemeColor),
      ),
      padding: EdgeInsets.fromLTRB(25.w, 15.h, 25.w, 15.h));
}

ButtonStyle submitButtonSmallStyle() {
  return TextButton.styleFrom(
      backgroundColor: ThemeColor.mainThemeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: ThemeColor.mainThemeColor),
      ),
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h));
}

ButtonStyle cancelButtonStyle() {
  return TextButton.styleFrom(
      backgroundColor: ThemeColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: Colors.black12),
      ),
      padding: EdgeInsets.fromLTRB(25.w, 15.h, 25.w, 15.h));
}
