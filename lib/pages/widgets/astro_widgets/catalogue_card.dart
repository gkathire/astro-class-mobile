import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/app_vectors.dart';

class CatalogueCard extends StatelessWidget {
  final String title;
  final int validityMonths;
  final int price;
  final Color color;
  final String iconPath;
  final bool isRecommended;
  const CatalogueCard(
      {super.key,
      required this.title,
      required this.validityMonths,
      required this.price,
      required this.color,
      required this.iconPath,
      this.isRecommended = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: const Color.fromRGBO(82, 124, 255, 0.10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Container(
              height: 8.h,
              width: 8.h,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: SvgPicture.asset(
                iconPath,
                height: 30,
              )),
            ),
            5.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                1.ph,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppVectors.clock,
                      height: 2.h,
                      color: AppColors.blueColor,
                    ),
                    2.pw,
                    Text(
                      validityMonths == 1
                          ? "$validityMonths month validity"
                          : "$validityMonths months validity",
                      style: const TextStyle(fontSize: 12, color: Colors.black),
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
                    2.pw,
                    Text(
                      "$price only",
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                if (isRecommended)
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueBackgroundColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "Recommeded",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blueColor),
                      ),
                    ),
                  )
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              AppVectors.rightArrow,
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }
}
