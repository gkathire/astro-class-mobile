import 'package:astro_mobile/pages/widgets/astro_widgets/video_details_footer_card.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/video_player_button.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/app_images.dart';
import '../../../../widgets/astro_widgets/welcome_container.dart';

class VideoDetailsPage extends StatefulWidget {
  const VideoDetailsPage({super.key});

  @override
  State<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Column(
          children: [
            1.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  Image.asset(
                    AppImages.sukran,
                    width: 55.w,
                    height: 5.h,
                    fit: BoxFit.contain,
                  ),
                  1.ph,
                  WelcomeContainer(
                    profileByesData: null,
                    title: "Basic #6 - 2 - Videos",
                    isLeadingArrow: true,
                  ),
                ],
              ),
            ),
            2.ph,
            Image.asset(AppImages.gurujiCropped),
            2.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VideoPlayerButton(
                          text: "Last Video",
                          icon: Icons.skip_previous_rounded),
                      VideoPlayerButton(
                          text: "Start Class",
                          icon: Icons.play_circle_fill_rounded),
                      VideoPlayerButton(
                          text: "Next Video", icon: Icons.skip_next_rounded),
                    ],
                  ),
                  2.ph,
                  Text(
                    "#1 - Introduction to Astrology",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text(
                    "Discover the foundations of astrology from zodiac signs to planetary influences and learn how the stars can guide life decisions.",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  2.ph,
                  Row(
                    spacing: 10,
                    children: [
                      VideoDetailsFooterCard(
                          title: "18th May", subTitle: "Date"),
                      VideoDetailsFooterCard(
                          title: "1 hr 12 min", subTitle: "Duration"),
                      VideoDetailsFooterCard(title: "Basic", subTitle: "Level"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
