import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';

Container spinnerWidget({bool transparent = false}) {
  return Container(
    color: transparent ? Colors.transparent : Colors.black12,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: ThemeColor.mainThemeColor,
            ),
          ],
        )
      ],
    ),
  );
}
