import 'dart:typed_data';

import 'package:astro_mobile/api/generated/code/astroclass.swagger.dart';
import 'package:astro_mobile/constant/app_images.dart';
import 'package:astro_mobile/pages/layout/sidebar/sidebar_widget.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/messages_widget.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/welcome_container.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesPage extends StatelessWidget {
  final LoggedInUserModel? userModel;
  final Uint8List? profileByesData;
  const MessagesPage(
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
                  title: "Messages",
                  subtitle: "Latest updates from your Guru",
                ),
                2.ph,
                Column(
                  children: [
                    MessagesWidget(
                      title: "Class Postponed",
                      subTitle:
                          "Today’s class has been postponed as I am travelling.",
                      time: "Just now",
                    ),
                    2.ph,
                    MessagesWidget(
                      title: "Class Postponed",
                      subTitle:
                          "Today’s class has been postponed as I am travelling.",
                      time: "Yesterday",
                    ),
                    2.ph,
                    MessagesWidget(
                      title: "Class Postponed",
                      subTitle:
                          "Today’s class has been postponed as I am travelling.",
                      time: "21/05",
                    ),
                    2.ph,
                    MessagesWidget(
                      title: "Class Postponed",
                      subTitle:
                          "Today’s class has been postponed as I am travelling.",
                      time: "13/05",
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
