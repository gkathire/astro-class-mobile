import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as path;

class GenericLabelAndValueWidget extends StatelessWidget {
  String imageSrc;
  String titleText;
  String subText;
  Widget? subWidget;
  GenericLabelAndValueWidget(
      {super.key,
      required this.imageSrc,
      required this.titleText,
      this.subWidget,
      required this.subText});
  @override
  Widget build(BuildContext context) {
    var fileExtension = path.extension(imageSrc);
    return SizedBox(
      // width: 150.w,
      height: 70.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (fileExtension == '.svg') ...[
                SvgPicture.asset(
                  imageSrc,
                  height: 15.h,
                  width: 10.w,
                ),
              ] else ...[
                Image(
                  image: AssetImage(imageSrc),
                  height: 20.h,
                  width: 15.w,
                ),
              ],
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                width: 100.w,
                child: Text(
                  titleText,
                  style: TextStyle(fontSize: 14, color: Color(0xff465BC8)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          if (subText.isNotEmpty) ...[
            SizedBox(
              width: 130.w,
              child: Text(
                subText,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
          if (subWidget != null) ...[
            SizedBox(
              child: subWidget,
            ),
          ]
        ],
      ),
    );
  }
}
