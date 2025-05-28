import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/app_vectors.dart';
import '../../../theme_data/theme_color.dart';

class BatchHeaderCard extends StatelessWidget {
  final String title;
  final String time;
  final String day;
  const BatchHeaderCard(
      {super.key, required this.title, required this.time, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
        color: AppColors.blueColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            height: 8.h,
            width: 8.h,
            padding: EdgeInsets.symmetric(
              horizontal: 3.5.w,
              vertical: 4.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: SvgPicture.asset(
              // fit: BoxFit.cover,
              AppVectors.mLogo,
              height: 4.h,
              width: 4.h,
              color: AppColors.blueColor,
            ),
          ),
          5.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                1.ph,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppVectors.clock,
                      color: Colors.white,
                      height: 2.h,
                    ),
                    1.pw,
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                    5.pw,
                    SvgPicture.asset(
                      AppVectors.calender,
                      height: 2.h,
                      color: Colors.white,
                    ),
                    1.pw,
                    Text(
                      day,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
