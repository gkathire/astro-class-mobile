import 'package:astro_mobile/constant/app_images.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeContainer extends StatelessWidget {
  final String? title, subtitle;
  const WelcomeContainer({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // subtle shadow
            offset: const Offset(0, 4), // only at the bottom
            blurRadius: 8,
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
                title ?? 'Welcome back, Vasu',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              0.6.ph,
              Text(
                subtitle ?? 'Let\'s explore the Sky!',
                style: TextStyle(color: Colors.black, fontSize: 15.sp),
              ),
            ],
          ),
          Spacer(),
          Stack(
            children: [
              CircleAvatar(
                radius: 20.sp,
                backgroundImage: AssetImage(AppImages.person),
              ),
              Positioned(
                top: -10,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(0.5.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    height: 4.h,
                    width: 3.w,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
