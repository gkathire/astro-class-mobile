import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/app_vectors.dart';

class BatchCard extends StatelessWidget {
  final String title;
  final int videosCount;
  final String startDate;
  final String endDate;
  final Color color;
  const BatchCard({
    super.key,
    required this.title,
    required this.videosCount,
    required this.startDate,
    required this.endDate,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Container(
              height: 8.h,
              width: 8.h,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: SvgPicture.asset(
                AppVectors.batch,
                height: 30,
              )),
            ),
            5.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                0.5.ph,
                Row(
                  children: [
                    Icon(
                      Icons.play_circle,
                      color: AppColors.blueColor,
                      size: 16.sp,
                    ),
                    2.pw,
                    Text(
                      "$videosCount Videos",
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
                0.5.ph,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppVectors.calender,
                      height: 16,
                    ),
                    2.pw,
                    Text(
                      "$startDate-$endDate",
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              AppVectors.rightArrow,
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }
}
