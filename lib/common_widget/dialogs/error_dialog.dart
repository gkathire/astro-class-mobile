import 'package:astro_mobile/common_widget/dialogs/generic_dialog.dart';
import 'package:astro_mobile/constant/constant.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
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
