import 'dart:typed_data';

import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/constant/app_images.dart';
import 'package:astro_mobile/constant/app_vectors.dart';
import 'package:astro_mobile/pages/layout/sidebar/sidebar_widget.dart';
import 'package:astro_mobile/pages/screens/astro_screens/screens/batches/batches_page.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/welcome_container.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClassListPage extends StatelessWidget {
  final LoggedInUserModel? userModel;
  final Uint8List? profileByesData;
  const ClassListPage(
      {super.key, required this.userModel, required this.profileByesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarWidget(
        profileByesData: profileByesData,
        userModel: userModel,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
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
                profileByesData: profileByesData,
                title: "Your Astrology Classes",
                subtitle: "Discover signs, planets and more",
              ),
              2.ph,

              /// 👇 This is the key change: Use `List.generate` instead of ListView
              ...List.generate(data.length, (index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BatchesPage())),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.h,
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
                        color: Colors.white,
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
                              color: data[index]['color'],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: SvgPicture.asset(
                              // fit: BoxFit.cover,
                              data[index]['icon'],
                              height: 4.h,
                              width: 4.h,
                            ),
                          ),
                          5.pw,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index]['title'],
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                0.7.ph,
                                Text(
                                  "Morning batch #3",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
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
                                    5.pw,
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
                          ),
                          Icon(
                            Icons.play_circle,
                            color: AppColors.blueColor,
                            size: 27.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> data = [
  {
    "title": "Basic of Astrology",
    "icon": AppVectors.mLogo,
    "color": AppColors.blueColor,
  },
  {
    "title": "Advanced Astrology",
    "icon": AppVectors.refresh,
    "color": AppColors.greenColor,
  },
  {
    "title": "Chart Analysis",
    "icon": AppVectors.saturnLogo,
    "color": AppColors.redCOlor,
  },
  {
    "title": "Free Vasthu Training",
    "icon": AppVectors.check,
    "color": AppColors.pinkColor,
  },
];
