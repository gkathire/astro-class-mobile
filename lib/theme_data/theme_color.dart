// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeColor {
  static late Color mainThemeColor;
  static late Color mainThemeDarkColor;
  static late Color mainThemeLightColor;
  static late Color mainThemeLightColorTwo;
  static late Color mainThemeLightColorThree;
  static late Color mainThemeLightColorFour;
  static late Color mainThemeLightColorForDialogBackground;
  static late Color black;
  static late Color white;
  static late Color greyBlue;
  static late Color darkGrey;
  static late Color lightGrey;
  static late Color lightGreyTwo;
  static late Color darkBlue;
  static late Color loadingBar;
  static late Color fullBar;
  static void setLightMode() {
    mainThemeColor = Color(0xFF7288FA);
    mainThemeDarkColor = Color(0xFF4050A6);
    mainThemeLightColor = Color.fromARGB(255, 36, 37, 41);
    mainThemeLightColorTwo = Color(0xFF7288FA);
    mainThemeLightColorThree = Color(0xFF8EA0FB);
    mainThemeLightColorFour = Color(0xFFEEF3FF);
    mainThemeLightColorForDialogBackground = Color.fromARGB(255, 213, 220, 255);
    black = Colors.black;
    white = Colors.white;
    greyBlue = Color(0xff7792BE);
    darkGrey = Color(0xff656565);
    lightGrey = Color(0xffC8C8C8);
    lightGreyTwo = Color.fromARGB(255, 247, 246, 246);
    darkBlue = Color.fromARGB(255, 64, 71, 109);
    loadingBar = Color(0xff546FFF);
    fullBar = Color(0xFF293998);
  }

  static void setDarkMode() {
    mainThemeColor = Color(0xFF7288FA);
    mainThemeDarkColor = Color(0xFF33419A);
    mainThemeLightColor = Color.fromARGB(255, 36, 37, 41);
    mainThemeLightColorTwo = Color(0xFF7288FA);
    mainThemeLightColorThree = Color(0xFF8EA0FB);
    mainThemeLightColorFour = Color(0xFFEEF3FF);
    mainThemeLightColorForDialogBackground = Color.fromARGB(255, 213, 220, 255);
    black = Colors.white;
    white = Colors.black;
    greyBlue = Color(0xff7792BE);
    darkGrey = Color(0xff656565);
    lightGrey = Color(0xffC8C8C8);
    lightGreyTwo = Color.fromARGB(255, 247, 246, 246);
    darkBlue = Color.fromARGB(255, 64, 71, 109);
    loadingBar = Color(0xff546FFF);
    fullBar = Color(0xff2220d4);
  }
}

class BadgeColors {
  static Color? badgeGreen = Colors.green[100];
  static Color? badgeRed = Colors.red[100];
  static Color? badgeYellow = Colors.yellow[100];
  static Color? badgeOrange = Colors.orange[100];
  static Color? badgeBlue = Colors.blue[100];
  static Color? badgeGray = Colors.grey[100];
  static Color? badgePurple = Colors.purple[100];
  static Color? badgeAmber = Colors.amber[100];
  static Color? badgeCyan = Colors.cyan[100];
  static Color? badgeIndigo = Colors.indigo[100];
  static Color? badgeLightBlue = Colors.lightBlue[100];
}

class SmallTextInternal extends StatelessWidget {
  Color? color;
  String text = "";
  double? fontSize;
  FontWeight? fontWeight;
  SmallTextInternal(
      {super.key,
      required Color color,
      required String text,
      required FontWeight fontWeight}) {
    this.color = color;
    this.text = text;
    this.fontWeight = fontWeight;
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight),
      textScaler: TextScaler.linear(1.2.sp),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class SmallText extends SmallTextInternal {
  SmallText(
      {super.key, required super.text, super.fontWeight = FontWeight.w500})
      : super(color: ThemeColor.black);
}

class MediumTextInternal extends StatelessWidget {
  Color? color;
  String text = "";
  double? fontSize;
  FontWeight? fontWeight;
  MediumTextInternal(
      {super.key,
      required Color color,
      required String text,
      required FontWeight fontWeight}) {
    this.color = color;
    this.text = text;
    this.fontWeight = fontWeight;
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight),
      textScaler: TextScaler.linear(1.4.sp),
    );
  }
}

class MediumTexte extends MediumTextInternal {
  MediumTexte(
      {super.key, required super.text, super.fontWeight = FontWeight.w500})
      : super(color: ThemeColor.white);
}

class BigTextInternal extends StatelessWidget {
  Color? color;
  String text = "";
  double? fontSize;
  FontWeight? fontWeight;
  BigTextInternal(
      {super.key,
      required Color color,
      required String text,
      required FontWeight fontWeight}) {
    this.color = color;
    this.text = text;
    this.fontWeight = fontWeight;
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight),
      textScaler: TextScaler.linear(1.8.sp),
    );
  }
}

class BigText extends BigTextInternal {
  BigText({super.key, required super.text, super.fontWeight = FontWeight.w500})
      : super(color: ThemeColor.white);
}

class ExtremelySmallTextInternal extends StatelessWidget {
  Color? color;
  String text = "";
  double? fontSize;
  FontWeight? fontWeight;
  ExtremelySmallTextInternal(
      {super.key,
      required Color color,
      required String text,
      required FontWeight fontWeight}) {
    this.color = color;
    this.text = text;
    this.fontWeight = fontWeight;
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight),
      textScaler: TextScaler.linear(1.sp),
    );
  }
}

class ExtremelySmallText extends ExtremelySmallTextInternal {
  ExtremelySmallText(
      {super.key, required super.text, super.fontWeight = FontWeight.w500})
      : super(color: ThemeColor.white);
}

class AppColors {
  static const textColor = Color(0xff000000);
  static const blueColor = Color(0xff527CFF);
  static const greyColor = Color(0xff78819c);
  static const pinkColor = Color(0xffEC82FF);
  static const redCOlor = Color(0xffFF7262);
  static const greenColor = Color(0xff0ACF83);
  static const lightBlueBackgroundColor = Color(0xffE5EBFF);
}
