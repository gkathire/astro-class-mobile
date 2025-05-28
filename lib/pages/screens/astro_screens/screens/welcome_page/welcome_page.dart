import 'dart:typed_data';

import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/constant/app_images.dart';
import 'package:astro_mobile/constant/app_vectors.dart';
import 'package:astro_mobile/pages/layout/sidebar/sidebar_widget.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/enrollment_summary_container.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/section_header.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/welcome_container.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomePage extends StatefulWidget {
  final LoggedInUserModel? userModel;
  final Uint8List? profileByesData;
  const WelcomePage(
      {super.key, required this.userModel, required this.profileByesData});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarWidget(
        profileByesData: widget.profileByesData,
        userModel: widget.userModel,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Column(
            children: [
              1.ph,
              Image.asset(
                AppImages.sukran,
                width: 55.w,
                height: 5.h,
                fit: BoxFit.contain,
              ),
              1.ph,
              WelcomeContainer(
                profileByesData: widget.profileByesData,
                title: "'Welcome back, ${widget.userModel?.firstName}",
                subtitle: 'Let\'s explore the Sky!',
              ),
              2.ph,
              EnrollmentSummaryContainer(),
              2.ph,
              Row(
                children: [
                  Text(
                    "Classes",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.blueColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 43.w, // Optional: give a width to card
                      margin: EdgeInsets.only(right: 3.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 24.sp,
                            backgroundColor: AppColors.blueColor,
                            child: SvgPicture.asset(
                              AppVectors.mLogo,
                              height: 3.h,
                            ),
                          ),
                          2.ph,
                          Text(
                            "Understanding the Zodiac",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                          1.ph,
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppVectors.clock,
                                color: AppColors.blueColor,
                                height: 2.h,
                              ),
                              1.pw,
                              Text(
                                "10:00 AM",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 15.sp,
                                ),
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                AppVectors.calender,
                                height: 2.h,
                                color: AppColors.blueColor,
                              ),
                              1.pw,
                              Text(
                                "Today",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                          1.ph,
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                color: AppColors.blueColor,
                                size: 17.sp,
                              ),
                              1.pw,
                              Text(
                                "999 only",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              1.5.ph,
              SectionHeader(title: "Messages", actionText: "View all"),
              1.ph,
              SizedBox(
                height: 19.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 70.w,
                      margin: EdgeInsets.only(right: 3.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.h,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 23.sp,
                                    backgroundImage: AssetImage(
                                      AppImages.guruji,
                                    ),
                                  ),
                                  1.4.ph,
                                  Text(
                                    "Guru Ji",
                                    style: TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          4.pw,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Class Postponed",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                1.ph,
                                Text(
                                  "Today’s class has been postponed as I am travelling.",
                                  style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 4, // or any number you need
                                  overflow: TextOverflow
                                      .ellipsis, // adds "..." at the end
                                ),
                                1.ph,
                                Row(
                                  children: [
                                    Text(
                                      "Just Now",
                                      style: TextStyle(
                                        color: AppColors.blueColor,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 2, // or any number you need
                                      overflow: TextOverflow
                                          .ellipsis, // adds "..." at the end
                                    ),
                                    1.5.pw,
                                    SvgPicture.asset(AppVectors.calender),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
