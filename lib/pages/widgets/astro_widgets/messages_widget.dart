import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/app_images.dart';
import '../../../constant/app_vectors.dart';

class MessagesWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String time;
  const MessagesWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
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
                    "Guru ji",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
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
                  title,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                1.ph,
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 4, // or any number you need
                  overflow: TextOverflow.ellipsis, // adds "..." at the end
                ),
                1.ph,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppVectors.clock,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.srcIn),
                    ),
                    1.5.pw,
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2, // or any number you need
                      overflow: TextOverflow.ellipsis, // adds "..." at the end
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
