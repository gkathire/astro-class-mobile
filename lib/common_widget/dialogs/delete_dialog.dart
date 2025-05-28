import 'package:astro_mobile/common_widget/dialogs/generic_dialog.dart';
import 'package:astro_mobile/constant/constant.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
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
