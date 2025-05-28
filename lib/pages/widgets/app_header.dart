import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter_app/constant/assets.dart';
import 'package:flutter_app/themedata/custom_text_scaler.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget appHeaderWidget(LoggedInUserModel? userModel) {
  return AppBar(
    leading: Container(),
    leadingWidth: 0,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundColor: ThemeColor.lightGrey,
          backgroundImage: const AssetImage(AppImageAssets.profileImage),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back!",
              textScaler: CustomTextScaler.smallTextTwo,
              style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.normal),
            ),
            Text(
              userModel?.firstName ?? "",
              textScaler: CustomTextScaler.smallTextOne,
              style: const TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
    backgroundColor: ThemeColor.white,
  );
}
