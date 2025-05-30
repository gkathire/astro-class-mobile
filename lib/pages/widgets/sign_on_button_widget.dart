// ignore_for_file: must_be_immutable

import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';

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
      child: Container(
          height: 55,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
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
                style: TextStyle(
                    color: ThemeColor.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ))
            ],
          )),
    );
  }
}
