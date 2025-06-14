import 'dart:typed_data';

import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/common_widget/no_data/no_data_found_widget.dart';
import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/constant/constant.dart';
import 'package:astro_mobile/models/app_custom_model.dart';
import 'package:astro_mobile/pages/screens/analytical_report/budget_expense_department_report/budget_expense_department_report.dart';
import 'package:astro_mobile/pages/screens/analytical_report/budget_expense_monthly_report/budget_expenses_monthly_report.dart';
import 'package:astro_mobile/pages/screens/analytical_report/budget_expense_resource_type_report/budget_expense_resource_type_report.dart';
import 'package:astro_mobile/pages/screens/analytical_report/out_standing_schedules_report/out_standing_schedule_report_landing.dart';
import 'package:astro_mobile/pages/screens/main_pages/dashboard/dashboard_category_menu_list.dart';
import 'package:astro_mobile/pages/screens/main_pages/dashboard/home_screen_category_card_widget.dart';
import 'package:astro_mobile/pages/screens/user/user_list_screen.dart';
import 'package:astro_mobile/screen_utils/currency_utils.dart';
import 'package:astro_mobile/screen_utils/screen_size_utils.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardHomeScreenContent extends StatefulWidget {
  final MovieModel? selectedMovie;
  final LoggedInUserModel? userModel;
  final List<MovieModel>? movieList;
  final Uint8List? movieProfileByesData;
  final int predefinedCurrencyTypeId;
  const DashboardHomeScreenContent({
    super.key,
    required this.selectedMovie,
    required this.movieList,
    required this.movieProfileByesData,
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

    if (widget.selectedMovie != null) {
      final String budgetAmount =
          CurrencyConversionUtils.getFormattedCurrencyApproxValue(
              amount: widget.selectedMovie?.budgetCost ?? 0,
              predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId);

      double progressValue = 0;
      String formattedLabelForAvlAmount = "";
      if ((widget.selectedMovie?.budgetCost ?? 0) <=
          (widget.selectedMovie?.actualCost ?? 0)) {
        progressValue = 1;
        formattedLabelForAvlAmount =
            "${CurrencyConversionUtils.getFormattedCurrencyApproxValue(amount: 0, predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}\n Available";
      } else {
        formattedLabelForAvlAmount =
            "${CurrencyConversionUtils.getFormattedCurrencyApproxValue(amount: ((widget.selectedMovie?.budgetCost ?? 0) - ((widget.selectedMovie?.actualCost ?? 0))), predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}\n Available";
        progressValue = ((widget.selectedMovie?.actualCost ?? 0) /
                (widget.selectedMovie?.budgetCost ?? 0))
            .toDouble();
      }

      void navigateToScreen({required int categoryMenuTypeId}) {
        switch (categoryMenuTypeId) {
          case PredefinedHomeScreenCategoryMenuTypes.companyUser:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserListScreen(
                        movieId: widget.selectedMovie?.movieId,
                        companyId: widget.selectedMovie?.companyId,
                      )),
            );

          /// resource type
          case PredefinedHomeScreenCategoryMenuTypes
                .analyticalReportResourceType:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BudgetExpenseResourceTypeReport(
                        companyId: widget.userModel?.companyId ?? 0,
                        movieId: widget.selectedMovie?.movieId ?? 0,
                        predefinedCurrencyTypeId:
                            widget.predefinedCurrencyTypeId,
                        key: widget.key,
                      )),
            );

          case PredefinedHomeScreenCategoryMenuTypes
                .analyticalReportByDepartment:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BudgetExpenseDepartmentReport(
                        companyId: widget.userModel?.companyId ?? 0,
                        movieId: widget.selectedMovie?.movieId ?? 0,
                        key: widget.key,
                        predefinedCurrencyTypeId:
                            widget.predefinedCurrencyTypeId,
                      )),
            );

          /// monthly
          case PredefinedHomeScreenCategoryMenuTypes.analyticalReportByMonthly:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BudgetExpenseMonthlyReport(
                        companyId: widget.userModel?.companyId ?? 0,
                        movieId: widget.selectedMovie?.movieId ?? 0,
                        key: widget.key,
                        predefinedCurrencyTypeId:
                            widget.predefinedCurrencyTypeId,
                      )),
            );

          case PredefinedHomeScreenCategoryMenuTypes
                .analyticalOutStandingReport:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OutStandingSchedulesReportLandingPage(
                      companyId: widget.userModel?.companyId,
                      movieProfileByesData: widget.movieProfileByesData,
                      predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
                      movieId: widget.selectedMovie?.movieId)),
            );
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
    } else {
      return const NoDataFoundWidget(
        canShowMessage: false,
      );
    }
  }
}
