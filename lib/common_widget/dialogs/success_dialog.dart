import 'package:astro_mobile/common_widget/dialogs/generic_dialog.dart';
import 'package:astro_mobile/constant/constant.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
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
