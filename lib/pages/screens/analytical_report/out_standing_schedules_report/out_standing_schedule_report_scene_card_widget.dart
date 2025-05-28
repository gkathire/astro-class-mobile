import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter_app/api/services/enum_text_color_service.dart';
import 'package:flutter_app/common_widget/badge/theme_badge.dart';
import 'package:flutter_app/common_widget/styles/content_style.dart';
import 'package:flutter_app/constant/assets.dart';
import 'package:flutter_app/themedata/custom_text_scaler.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutStandingScheduleReportSceneCardWidget extends StatelessWidget {
  const OutStandingScheduleReportSceneCardWidget(
      {super.key,
      required this.movieSceneList,
      required this.enumTextColorService,
      required this.completedMovieScenesCount,
      required this.notCompletedMovieSceneCount});
  final List<MovieSceneModel>? movieSceneList;
  final int completedMovieScenesCount;
  final int notCompletedMovieSceneCount;
  final EnumTextColorService enumTextColorService;

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
                              image: AssetImage(AppImageAssets.movieSceneImage),
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
                                    "Scenes",
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
                                              "$notCompletedMovieSceneCount / ${completedMovieScenesCount + notCompletedMovieSceneCount}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              //print(widget.movieSceneModel!.);
                            },
                            child: Icon(
                              Icons.keyboard_arrow_right,
                            ))
                      ],
                    )),
                if (movieSceneList != null) ...[
                  if (movieSceneList!.isEmpty) ...[
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("No scenes available"),
                    SizedBox(
                      height: 20.h,
                    ),
                  ] else ...[
                    for (var scene in movieSceneList!) ...[
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
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    '${scene.movieSceneName}  - ${scene.movieSceneCode}',
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
                                        .getPredefinedMovieSceneStatusTypeText(
                                            scene.predefinedMovieSceneStatusTypeId ??
                                                0),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      '${scene.setup}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.mainThemeColor),
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
