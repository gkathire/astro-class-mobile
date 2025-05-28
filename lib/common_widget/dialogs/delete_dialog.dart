import 'package:flutter_app/common_widget/dialogs/generic_dialog.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      messageAlertTypeId: MessageAlertTypes.error,
      title: "Delete",
      content: "Are you sure you want to delete note?",
      optionBuilder: () => {
            'Cancel': AlertDialogOptions(
                color: ThemeColor.mainThemeColor, value: true),
            'yes': AlertDialogOptions(color: Colors.red, value: true),
          }).then((value) => value ?? false);
}
