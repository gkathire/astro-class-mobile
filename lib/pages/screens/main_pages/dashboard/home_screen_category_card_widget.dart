import 'package:flutter/material.dart';
import 'package:flutter_app/framework/common/utils/list_utils.dart';
import 'package:flutter_app/models/app_custom_model.dart';
import 'package:flutter_app/pages/screens/main_pages/dashboard/home_screen_category_card_Item_widget.dart';
import 'package:flutter_app/screen_utils/screen_size_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnClickMenuCategoryItemCallback = void Function(int categoryMenuTypeId);

class HomeScreenCategoryCardWidget extends StatefulWidget {
  final HomeScreenCategoryMenuModel homeScreenCategory;
  final OnClickMenuCategoryItemCallback menuCategoryItemCallback;
  const HomeScreenCategoryCardWidget({
    super.key,
    required this.menuCategoryItemCallback,
    required this.homeScreenCategory,
  });

  @override
  State<HomeScreenCategoryCardWidget> createState() =>
      _HomeScreenCategoryCardWidgetState();
}

class _HomeScreenCategoryCardWidgetState
    extends State<HomeScreenCategoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = ScreenSizeUtils.getScreenWidth(context);
    var menuGroups = ListUtils.splitListByRange(
        widget.homeScreenCategory.homeScreenCategoryItems, 4);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      // width: screenWidth,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.homeScreenCategory.categorySectionTitle,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (menuGroups.isNotEmpty) ...[
            for (var group in menuGroups) ...[
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (var menu in group) ...[
                    HomeScreenCategoryCardItemWidget(
                      categoryMenuIcon: menu.categoryMenuIcon,
                      categoryMenuLabel: menu.categoryMenuLabel,
                      categoryMenuTypeId: menu.categoryMenuTypeId,
                      menuCategoryItemCallback: (categoryMenuTypeId) {
                        widget.menuCategoryItemCallback(categoryMenuTypeId);
                      },
                    ),
                  ]
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              // row 2
            ]
          ],
        ],
      ),
    );
  }
}
