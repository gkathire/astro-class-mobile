import 'package:flutter_app/common_widget/dialogs/generic_dialog.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';

Future<void> showSuccessDialog(
  BuildContext context,
  String text,
) async {
  // Simulate an async operation
  return await showGenericDialog(
      context: context,
      title: "Success",
      content: text,
      messageAlertTypeId: MessageAlertTypes.success,
      optionBuilder: () => {
            "": null,
            "Okay": AlertDialogOptions(
                color: ThemeColor.mainThemeColor, value: null),
          });
}
