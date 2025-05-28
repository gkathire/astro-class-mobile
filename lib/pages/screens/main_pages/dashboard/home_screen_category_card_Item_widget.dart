import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as path;

import 'home_screen_category_card_widget.dart';

class HomeScreenCategoryCardItemWidget extends StatefulWidget {
  String categoryMenuIcon = '';
  String categoryMenuLabel = '';
  int? categoryMenuTypeId;
  OnClickMenuCategoryItemCallback menuCategoryItemCallback;
  HomeScreenCategoryCardItemWidget({
    super.key,
    required this.categoryMenuIcon,
    required this.categoryMenuLabel,
    required this.categoryMenuTypeId,
    required this.menuCategoryItemCallback,
  });

  @override
  State<HomeScreenCategoryCardItemWidget> createState() =>
      _HomeScreenCategoryCardItemWidgetState();
}

class _HomeScreenCategoryCardItemWidgetState
    extends State<HomeScreenCategoryCardItemWidget> {
  @override
  Widget build(BuildContext context) {
    var fileExtension = path.extension(widget.categoryMenuIcon);

    return Expanded(
        child: InkWell(
      child: Column(
        children: [
          if (widget.categoryMenuTypeId != null &&
              widget.categoryMenuTypeId! > 0) ...[
            if (fileExtension == '.svg') ...[
              SvgPicture.asset(
                widget.categoryMenuIcon,
                width: 30.w,
              ),
            ] else ...[
              Image(
                image: AssetImage(widget.categoryMenuIcon),
                width: 30.w,
              ),
            ],
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.categoryMenuLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ] else ...[
            Container(),
          ],
        ],
      ),
      onTap: () {
        widget.menuCategoryItemCallback(widget.categoryMenuTypeId ?? 0);
      },
    ));
  }
}
