import 'package:flutter_app/pages/loading_widgets/custom_shimmer_widget.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayCardViewLoadingWidget extends StatelessWidget {
  const DayCardViewLoadingWidget({super.key});

  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
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
                      bottomLeft: Radius.circular(10)),
                  color: ThemeColor.mainThemeColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomShimmerWidget.rectangular(width: 40.w, height: 20.w),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomShimmerWidget.rectangular(width: 30.w, height: 30.w)
                ],
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CustomShimmerWidget.rectangular(width: 100.w, height: 20.h),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    CustomShimmerWidget.rectangular(width: 40.w, height: 20.w),
                    CustomShimmerWidget.rectangular(width: 70.w, height: 20.w)
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 200.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomShimmerWidget.rectangular(
                                width: 60.w, height: 20.h),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 20.h)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomShimmerWidget.rectangular(
                                width: 60.w, height: 20.h),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomShimmerWidget.rectangular(
                                width: 70.w, height: 20.h)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Center(
                child: CustomShimmerWidget.circular(width: 40.w, height: 40.h))
          ],
        ),
      ),
    );
  }
}
