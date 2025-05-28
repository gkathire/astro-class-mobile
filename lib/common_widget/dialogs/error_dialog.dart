import 'package:flutter_app/common_widget/dialogs/generic_dialog.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) async {
  return await showGenericDialog(
      context: context,
      title: "Error",
      messageAlertTypeId: MessageAlertTypes.error,
      content: text,
      optionBuilder: () => {
            "": null,
            "Close": AlertDialogOptions(
                color: ThemeColor.mainThemeColor, value: null),
          });
}
