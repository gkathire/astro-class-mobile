import 'dart:typed_data';

import 'package:astro_mobile/constant/app_vectors.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/enrollment_summary_container.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../api/generated/code/filmicall.swagger.dart';
import '../../../../../constant/app_images.dart';
import '../../../../../theme_data/theme_color.dart';

class ProfilePage extends StatelessWidget {
  final LoggedInUserModel? userModel;
  final Uint8List? profileByesData;
  const ProfilePage({super.key, this.userModel, this.profileByesData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              4.ph,
              Center(
                child: Text(
                  "My Profile",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              1.5.ph,
              Stack(
                children: [
                  profileByesData != null
                      ? ClipOval(
                          child: Image.memory(
                            profileByesData!,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        )
                      : CircleAvatar(
                          radius: 35.sp,
                          backgroundColor: ThemeColor.lightGrey,
                          backgroundImage: AssetImage(AppImages.person),
                        ),
                  Positioned(
                    right: 1.w,
                    bottom: 1.h,
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppVectors.editProfile)),
                  )
                ],
              ),
              3.ph,
              Text(
                "Guru K",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              1.ph,
              Text(
                "guruthelegend@gmail.com | +91 9820980123",
                style: TextStyle(color: Colors.black),
              ),
              2.ph,
              EnrollmentSummaryContainer(),
              2.ph,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ProfileRowWidget(
                        iconPath: AppVectors.editProfileInfo,
                        text: "Edit Profile Information"),
                    Divider(color: Colors.black.withOpacity(0.1)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppVectors.notification),
                          3.pw,
                          Text(
                            "Notifications",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            "ON",
                            style: TextStyle(color: AppColors.blueColor),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black.withOpacity(0.1)),
                    ProfileRowWidget(
                        iconPath: AppVectors.settings, text: "Settings"),
                    Divider(color: Colors.black.withOpacity(0.1)),
                    ProfileRowWidget(
                        iconPath: AppVectors.helpAndSupport,
                        text: "Help & Support"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileRowWidget extends StatelessWidget {
  final String iconPath;
  final String text;
  const ProfileRowWidget(
      {super.key, required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          3.pw,
          Text(
            text,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
