import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as path;

class DailyStatusReportAmountCard extends StatefulWidget {
  final String label;
  final String value;
  final String imageSrc;
  const DailyStatusReportAmountCard(
      {super.key,
      required this.label,
      required this.value,
      required this.imageSrc});

  @override
  State<DailyStatusReportAmountCard> createState() =>
      _DailyStatusReportAmountCardState();
}

class _DailyStatusReportAmountCardState
    extends State<DailyStatusReportAmountCard> {
  @override
  Widget build(BuildContext context) {
    var fileExtension = path.extension(widget.imageSrc);

    return Card(
      color: Colors.white,
      child: Container(
        padding: ContentStyle.contentSmallPadding,
        width: 150.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (fileExtension == '.svg') ...[
                  SvgPicture.asset(
                    widget.imageSrc,
                    height: 20.h,
                    width: 20.w,
                  ),
                ] else ...[
                  Image(
                    image: AssetImage("${widget.imageSrc}"),
                    height: 20.h,
                    width: 20.w,
                  ),
                ],
                Column(
                  children: [
                    SizedBox(
                      width: 75.w,
                      child: Text(
                        widget.label,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      width: 75.w,
                      child: Text(
                        widget.value,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            color: ThemeColor.mainThemeColor),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
