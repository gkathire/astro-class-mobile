import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/constant/constant.dart';
import 'package:astro_mobile/models/app-model.dart';
import 'package:astro_mobile/models/app_custom_model.dart';
import 'package:astro_mobile/pages/screens/main_pages/dashboard/dashboard_category_menu_list.dart';
import 'package:astro_mobile/pages/screens/main_pages/dashboard/home_screen_category_card_widget.dart';
import 'package:astro_mobile/pages/screens/user/user_list_screen.dart';
import 'package:astro_mobile/screen_utils/screen_size_utils.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardHomeScreenContent extends StatefulWidget {
  final LoggedInUserModel? userModel;
  final int predefinedCurrencyTypeId;
  const DashboardHomeScreenContent({
    super.key,
    required this.predefinedCurrencyTypeId,
    required this.userModel,
  });
  @override
  State<StatefulWidget> createState() => _DashboardHomeScreenContentState();
}

class _DashboardHomeScreenContentState
    extends State<DashboardHomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = ScreenSizeUtils.getScreenWidth(context);
    List<HomeScreenCategoryMenuModel> categories = dashboardCategoryMenuList;

    void navigateToScreen({required int categoryMenuTypeId}) {
      switch (categoryMenuTypeId) {
        case PredefinedHomeScreenCategoryMenuTypes.companyUser:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserListScreen(
                      companyId: widget.userModel?.companyId,
                    )),
          );

        /// resource type
        case PredefinedHomeScreenCategoryMenuTypes.analyticalReportResourceType:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => DefectsByCategoryReport(
        //             companyId: widget.userModel?.companyId ?? 0,
        //             predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
        //             key: widget.key,
        //           )),
        // );

        case PredefinedHomeScreenCategoryMenuTypes.analyticalReportByDepartment:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => BudgetExpenseDepartmentReport(
        //             companyId: widget.userModel?.companyId ?? 0,
        //             key: widget.key,
        //             predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
        //           )),
        // );

        /// monthly
        case PredefinedHomeScreenCategoryMenuTypes.analyticalReportByMonthly:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => BudgetExpenseMonthlyReport(
        //             companyId: widget.userModel?.companyId ?? 0,
        //             key: widget.key,
        //             predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
        //           )),
        // );
      }
    }

    return SingleChildScrollView(
      padding: ContentStyle.contentSmallPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  child: Text(
                "Categories",
                textScaler: CustomTextScaler.headerThree,
                style: TextStyle(
                  color: ThemeColor.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                width: 130.w,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                      style: TextStyle(color: ThemeColor.mainThemeColor),
                      "See All"))
            ],
          ),
          SizedBox(
            height: 330.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var category in categories) ...[
                    HomeScreenCategoryCardWidget(
                        menuCategoryItemCallback: (categoryMenuTypeId) {
                          navigateToScreen(
                              categoryMenuTypeId: categoryMenuTypeId);
                        },
                        homeScreenCategory: category),
                    SizedBox(height: 20.h),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
