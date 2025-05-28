import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as path;

class InfoMenuWidget extends StatelessWidget {
  final String imageSrcPath;
  final String title;
  final Function? onTap;
  InfoMenuWidget(
      {super.key,
      required this.imageSrcPath,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var fileExtension = path.extension(imageSrcPath);

    return InkWell(
      onTap: () {
        if (this.onTap != null) {
          this.onTap!();
        }
      },
      child: Card(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (fileExtension == '.svg') ...[
                    SvgPicture.asset(
                      imageSrcPath,
                      width: 25.w,
                    ),
                  ] else ...[
                    Image(
                      image: AssetImage(imageSrcPath),
                      width: 25.w,
                    ),
                  ],
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(title),
                ],
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
