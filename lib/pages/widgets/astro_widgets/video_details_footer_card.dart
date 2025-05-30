import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme_data/theme_color.dart';

class VideoDetailsFooterCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const VideoDetailsFooterCard(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.5.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: AppColors.blueColor.withValues(alpha: 0.2))),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black),
            ),
            1.ph,
            Text(
              subTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black.withValues(alpha: 0.4)),
            ),
          ],
        ),
      ),
    );
  }
}
