import 'package:astro_mobile/pages/screens/astro_screens/screens/videos/videos_page.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/batch_card.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/batch_header_card.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/app_images.dart';
import '../../../../widgets/astro_widgets/welcome_container.dart';

class BatchesPage extends StatefulWidget {
  const BatchesPage({super.key});

  @override
  State<BatchesPage> createState() => _BatchesPageState();
}

class _BatchesPageState extends State<BatchesPage> {
  List pastBatches = [
    {
      "title": "Batch #5 - 3",
      "videosCount": 12,
      "startDate": "1 Jan",
      "endDate": "14 Feb 2025",
      "color": AppColors.pinkColor
    },
    {
      "title": "Batch #5 - 4",
      "videosCount": 6,
      "startDate": "15 Feb",
      "endDate": "30 Mar 2025",
      "color": AppColors.redCOlor
    },
    {
      "title": "Batch #6 - 1",
      "videosCount": 8,
      "startDate": "1 Mar",
      "endDate": "30 Apr 2025",
      "color": AppColors.blueColor
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              profileByesData: null,
              title: "Basic Class- Batches",
              isLeadingArrow: true,
            ),
            2.ph,
            Column(
              children: [
                BatchHeaderCard(
                  title: "Basics of Astrology",
                  time: "10:00 AM",
                  day: "Today",
                ),
                2.ph,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Current Batch",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blueColor),
                  ),
                ),
                1.ph,
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VideosPage())),
                  child: BatchCard(
                      title: "Batch #6 - 2",
                      videosCount: 5,
                      startDate: "1 Apr",
                      endDate: "30 May 2025",
                      color: AppColors.greenColor),
                ),
                2.ph,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Past Batches",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blueColor),
                  ),
                ),
                1.ph,
                ListView.builder(
                    itemCount: pastBatches.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideosPage())),
                          child: BatchCard(
                              title: pastBatches[index]['title'],
                              videosCount: pastBatches[index]['videosCount'],
                              startDate: pastBatches[index]['startDate'],
                              endDate: pastBatches[index]['endDate'],
                              color: pastBatches[index]['color']),
                        ),
                      );
                    }),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
