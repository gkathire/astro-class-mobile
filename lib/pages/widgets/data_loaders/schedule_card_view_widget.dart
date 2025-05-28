import 'package:flutter_app/pages/loading_widgets/custom_shimmer_widget.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleCardViewWidgetLoadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      child: Card(
        color: ThemeColor.white,
        margin: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: ThemeColor.mainThemeColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomShimmerWidget.rectangular(width: 40.w, height: 30.h),
                  CustomShimmerWidget.rectangular(width: 40.w, height: 30.h),
                  CustomShimmerWidget.rectangular(width: 40.w, height: 15.w),
                  CustomShimmerWidget.rectangular(width: 40.w, height: 15.w),
                ],
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomShimmerWidget.rectangular(width: 100.w, height: 30.w),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      CustomShimmerWidget.rectangular(
                          width: 40.w, height: 20.w),
                      CustomShimmerWidget.rectangular(
                          width: 100.w, height: 20.w),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 190.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 15.w),
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 15.w),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 15.w),
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 15.w),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 15.w),
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 15.w),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 15.w),
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 15.w),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}
