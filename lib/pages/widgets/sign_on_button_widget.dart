// ignore_for_file: must_be_immutable

import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseSignOnButton extends StatelessWidget {
  String? label;
  BaseSignOnButton(String label, {super.key}) {
    this.label = label;
  }
  String logo() {
    if (label == "microsoft") {
      return AppImageAssets.microsoftImage;
    } else if (label == "google") {
      return AppImageAssets.googleImage;
    } else if (label == "facebook") {
      return AppImageAssets.facebookImage;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 55,
          width: 0.8.sw,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                side: BorderSide(color: ThemeColor.lightGrey),
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(logo()),
                        height: 50,
                      ),
                      Center(
                          child: Text(
                        "Login with Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ThemeColor.black),
                      ))
                    ],
                  )))),
    );
  }
}
