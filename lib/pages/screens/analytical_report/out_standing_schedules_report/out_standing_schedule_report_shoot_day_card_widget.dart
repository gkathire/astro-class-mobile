import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/api/services/enum_badge_service.dart';
import 'package:astro_mobile/api/services/enum_text_color_service.dart';
import 'package:astro_mobile/common_widget/badge/theme_badge.dart';
import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/framework/common/utils/date_utils.dart';
import 'package:astro_mobile/themedata/custom_text_scaler.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutStandingScheduleReportShootDayCardWidget extends StatelessWidget {
  const OutStandingScheduleReportShootDayCardWidget(
      {super.key,
      required this.movieShootDayList,
      required this.enumTextColorService,
      required this.enumBadgeService,
      required this.completedMovieShootDaysCount,
      required this.notCompletedMovieShootDayCount});
  final List<MovieShootDayModel>? movieShootDayList;
  final int completedMovieShootDaysCount;
  final int notCompletedMovieShootDayCount;
  final EnumTextColorService enumTextColorService;
  final EnumBadgeService enumBadgeService;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Container(
            width: 350.w,
            child: Column(
              children: [
                Container(
                    padding: ContentStyle.contentSmallPadding,
                    decoration: ContentStyle.contentBoxDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(AppImageAssets.calendarImage),
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Schedules",
                                    textScaler: CustomTextScaler.headerThree,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Out Standing: ",
                                        textScaler: CustomTextScaler.normalText,
                                        style: TextStyle(
                                          color: ThemeColor.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      ThemeBadge(
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.blue,
                                          fontSize: 10,
                                          badgeText:
                                              "$notCompletedMovieShootDayCount / ${completedMovieShootDaysCount + notCompletedMovieShootDayCount}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              //print(widget.movieShootDayModel!.);
                            },
                            child: Icon(
                              Icons.keyboard_arrow_right,
                            ))
                      ],
                    )),
                if (movieShootDayList != null) ...[
                  if (movieShootDayList!.isEmpty) ...[
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("No out standing schedules available"),
                    SizedBox(
                      height: 20.h,
                    ),
                  ] else ...[
                    for (var shootDay in movieShootDayList!) ...[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SvgPicture.asset(
                            //   AppImageAssets.checkSvgIcon,
                            //   height: 25,
                            //   width: 25,
                            // ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                enumBadgeService
                                    .getPredefinedBudgetDivisionTypeBadge(
                                        shootDay.predefinedBudgetDivisionTypeId ??
                                            0),
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    '#${shootDay.dayNumber} - ${shootDay.shootSummary}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    enumTextColorService
                                        .getPredefinedMovieShootDayStatusTypeText(
                                            shootDay.predefinedMovieShootDayStatusTypeId ??
                                                0),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      CustomDateUtils.getFormattedDate(
                                          date: shootDay.dateOfShoot),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.2,
                      ),
                    ]
                  ],
                ],
              ],
            )));
  }
}
