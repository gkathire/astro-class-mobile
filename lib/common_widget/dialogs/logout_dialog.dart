import 'package:astro_mobile/common_widget/dialogs/generic_dialog.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      title: "Logout",
      messageAlertTypeId: null,
      content: "Are you sure you want to logout ?",
      optionBuilder: () => {
            "No": AlertDialogOptions(
                color: ThemeColor.mainThemeColor,
                backgroundColor: Colors.white,
                value: false),
            "Yes": AlertDialogOptions(
                color: ThemeColor.mainThemeColor,
                backgroundColor: Colors.white,
                value: true),
          }).then((value) => value ?? false);
}
