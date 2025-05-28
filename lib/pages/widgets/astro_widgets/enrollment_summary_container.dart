import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/app_vectors.dart';

class EnrollmentSummaryContainer extends StatelessWidget {
  const EnrollmentSummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // subtle shadow
            offset: const Offset(0, 4), // only at the bottom
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enrolment Summary",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              1.ph,
              Row(
                children: [
                  Text(
                    "Morning Batch #3",
                    style: TextStyle(
                      color: AppColors.blueColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  3.pw,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 0.8.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffE5EBFF),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Text(
                      "Active",
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              1.5.ph,
              Row(
                children: [
                  Text(
                    "Valid Until 27/06",
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  3.pw,
                  SvgPicture.asset(
                    AppVectors.calender,
                    color: AppColors.blueColor,
                    height: 2.8.h,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          CircularPercentIndicator(
            radius: 50.0,
            lineWidth: 7.0,
            percent: 0.75,
            center: Text(
              "75%",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
                fontSize: 16.sp,
              ),
            ),
            footer: Text(
              "In Progress",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.greyColor,
                fontSize: 16.sp,
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColors.blueColor,
          ),
        ],
      ),
    );
  }
}
