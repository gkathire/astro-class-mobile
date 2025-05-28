import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/screen_utils/screen_size_utils.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef SearchFieldTypeCallback = void Function(String? value);

class SearchTextField extends StatelessWidget {
  String? label;
  TextEditingController? controller;
  SearchFieldTypeCallback onSearchValue;
  double? width;
  double? height;
  double? innerWidth;
  Decoration? fieldDecoration;
  bool? autofocus;
  Color? cursorColor;
  Color? inputTextColor;
  SearchTextField(
      {super.key,
      this.label,
      required this.controller,
      required this.onSearchValue,
      this.width,
      this.autofocus,
      this.height,
      this.fieldDecoration,
      this.cursorColor,
      this.inputTextColor,
      this.innerWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? (ScreenSizeUtils.getScreenWidth(context) - 20.w),
        height: height ?? 50.h,
        decoration: fieldDecoration ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ThemeColor.white,
                border: Border.all(color: ThemeColor.mainThemeColor)),
        child: Row(
          children: [
            SizedBox(width: 20.w),
            const Image(
              image: AssetImage(AppImageAssets.glassImage),
            ),
            SizedBox(width: 10.w),
            SizedBox(
              width:
                  innerWidth ?? (ScreenSizeUtils.getScreenWidth(context) - 200),
              child: TextField(
                cursorColor: cursorColor ?? Colors.black,
                style: TextStyle(
                  color: inputTextColor ?? Colors.black,
                ),
                controller: controller,
                onChanged: (value) {
                  onSearchValue(value);
                },
                autofocus: autofocus ?? false,
                decoration: InputDecoration(
                    hintText: label,
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                        height: 2,
                        letterSpacing: 0.01,
                        fontSize: 15,
                        color: ThemeColor.lightGrey),
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
          ],
        ));
  }
}
