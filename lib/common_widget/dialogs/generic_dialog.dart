import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/constant/constant.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as path;

typedef DialogOptionBuilder<T> = Map<String, AlertDialogOptions?> Function();

class AlertDialogOptions {
  bool? value;
  Color? color;
  Color? backgroundColor;
  AlertDialogOptions(
      {required this.color, required this.value, this.backgroundColor});
}

Future<T?> showGenericDialog<T>(
    {required BuildContext context,
    required String title,
    required String content,
    required int? messageAlertTypeId,
    required DialogOptionBuilder optionBuilder}) async {
  var imagePath = AppImageAssets.alertSuccessIcon;
  if (messageAlertTypeId == MessageAlertTypes.success) {
    imagePath = AppImageAssets.alertSuccessIcon;
  } else if (messageAlertTypeId == MessageAlertTypes.error) {
    imagePath = AppImageAssets.alertErrorIcon;
  } else if (messageAlertTypeId == MessageAlertTypes.warning) {
    imagePath = AppImageAssets.alertWarningIcon;
  } else if (messageAlertTypeId == MessageAlertTypes.information) {
    imagePath = AppImageAssets.alertInfoIcon;
  }
  var fe = path.extension(imagePath);

  final options = optionBuilder();
  // await Future.delayed(const Duration(seconds: 1));
  return await showDialog<T>(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(5)), // No border radius
            ),
            title: Row(
              children: [
                if (messageAlertTypeId != null) ...[
                  if (fe == ".svg") ...[
                    SvgPicture.asset(
                      imagePath,
                      height: 25,
                      width: 25,
                    )
                  ] else ...[
                    Image(
                      image: AssetImage(imagePath),
                      height: 25,
                      width: 25,
                    )
                  ],
                ],
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Container(
              padding: EdgeInsets.fromLTRB(0, 10.h, 5.w, 10.h),
              child: Text(content),
            ),
            actionsAlignment: MainAxisAlignment.end,
            actionsPadding: ContentStyle.contentSmallPadding,
            actions: [
              Container(
                decoration: options.keys.length <= 1
                    ? BoxDecoration()
                    : BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade100,
                              width: 1.0), // Add top border
                        ),
                      ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 3,
                  children: options.keys.map((optionTitle) {
                    final AlertDialogOptions? option = options[optionTitle];
                    final value = option?.value;
                    final Color textColor =
                        option?.color ?? ThemeColor.mainThemeColor;
                    final Color backgroundColor = option?.backgroundColor ??
                        ThemeColor.mainThemeLightColorFour;
                    if (option != null) {
                      return Expanded(
                        child: InkWell(
                            onTap: () {
                              if (value != null) {
                                Navigator.of(context).pop(option.value);
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              padding: ContentStyle.contentSmallPadding,
                              color: backgroundColor,
                              child: Text(
                                textAlign: TextAlign.center,
                                optionTitle,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      );
                    } else {
                      return Expanded(
                        flex: 1,
                        child: Container(),
                      );
                    }
                  }).toList(),
                ),
              )
            ]);
      });
}
