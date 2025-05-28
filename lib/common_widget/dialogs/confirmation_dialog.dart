import 'package:astro_mobile/common_widget/dialogs/generic_dialog.dart';
import 'package:astro_mobile/constant/constant.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(
    BuildContext context, String? title, String? message) {
  return showGenericDialog(
      context: context,
      title: title ?? "",
      content: message ?? "",
      messageAlertTypeId: MessageAlertTypes.warning,
      optionBuilder: () => {
            "Yes": AlertDialogOptions(
              color: Colors.red,
              value: true,
            ),
            "No": AlertDialogOptions(
              color: ThemeColor.mainThemeColor,
              value: false,
            ),
          }).then((value) => value ?? false);
}
