import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/app_vectors.dart';

class VideoCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final bool isRoundedBorders;
  const VideoCard(
      {super.key,
      required this.title,
      required this.date,
      required this.time,
      this.isRoundedBorders = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: isRoundedBorders
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : [],
        borderRadius: BorderRadius.circular(isRoundedBorders ? 14 : 0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Icon(
              Icons.play_circle,
              color: AppColors.blueColor,
              size: 25.sp,
            ),
            3.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppVectors.calender,
                      height: 14,
                    ),
                    1.5.pw,
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppVectors.clock,
                      height: 14,
                    ),
                    2.pw,
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
