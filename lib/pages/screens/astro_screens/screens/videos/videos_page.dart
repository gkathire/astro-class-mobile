import 'package:astro_mobile/pages/widgets/astro_widgets/video_card.dart';
import 'package:astro_mobile/pages/widgets/search_text_field.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/app_images.dart';
import '../../../../../theme_data/theme_color.dart';
import '../../../../widgets/astro_widgets/batch_header_card.dart';
import '../../../../widgets/astro_widgets/custom_tab.dart';
import '../../../../widgets/astro_widgets/welcome_container.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  List pastWeekVideos = [
    {
      "title": "1 - Understanding 12 Zodiac Signs",
      "date": "30 May 2025",
      "time": "02:15:50",
    },
    {
      "title": "2 - What are the Houses in Astrology",
      "date": "30 May 2025",
      "time": "02:15:50",
    },
    {
      "title": "3 - Rahu & Ketu - The Shadow Planets",
      "date": "30 May 2025",
      "time": "02:15:50",
    },
    {
      "title": "4 - How to Read a Janma Kundali",
      "date": "30 May 2025",
      "time": "02:15:50",
    },
  ];
  int selectedIndex = 0;
  final TextEditingController searchController = TextEditingController();

  void selectIndex(int value) {
    selectedIndex = value;
    setState(() {});
  }

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
              title: "Basic #6 - 2 - Videos",
              isLeadingArrow: true,
            ),
            1.ph,
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // subtle shadow
                    offset: const Offset(0, 4), // only at the bottom
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: SearchTextField(
                  controller: searchController,
                  label: "Search here",
                  onSearchValue: (value) {}),
            ),
            2.ph,
            BatchHeaderCard(
              title: "Basics of Astrology",
              time: "10:00 AM",
              day: "Today",
            ),
            2.ph,
            Row(
              children: [
                CustomTab(
                    text: "Media",
                    isSelected: selectedIndex == 0,
                    onTap: () => selectIndex(0)),
                2.pw,
                CustomTab(
                    text: "Other Files",
                    isSelected: selectedIndex == 1,
                    onTap: () => selectIndex(1)),
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Current Videos",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blueColor),
                  ),
                ),
                1.ph,
                VideoCard(
                    title: "5 - Planetary Transits and Their Effects",
                    date: "30 May 2025",
                    time: "02:15:50"),
                2.ph,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Past Week Videos",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blueColor),
                  ),
                ),
                1.ph,
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: ListView.separated(
                        itemCount: pastWeekVideos.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Divider(
                              height: 0,
                              color: Colors.black.withOpacity(0.1),
                            ),
                        itemBuilder: (context, index) {
                          return VideoCard(
                            title: pastWeekVideos[index]['title'],
                            date: pastWeekVideos[index]['date'],
                            time: pastWeekVideos[index]['time'],
                            isRoundedBorders: false,
                          );
                        }),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
