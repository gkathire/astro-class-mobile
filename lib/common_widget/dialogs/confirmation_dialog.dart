import 'package:flutter_app/common_widget/dialogs/generic_dialog.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/themedata/themecolor.dart';
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
