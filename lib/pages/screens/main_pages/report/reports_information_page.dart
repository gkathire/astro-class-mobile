import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter_app/constant/assets.dart';
import 'package:flutter_app/pages/screens/analytical_report/budget_expense_department_report/budget_expense_department_report.dart';
import 'package:flutter_app/pages/screens/analytical_report/budget_expense_monthly_report/budget_expenses_monthly_report.dart';
import 'package:flutter_app/pages/screens/analytical_report/budget_expense_resource_type_report/budget_expense_resource_type_report.dart';
import 'package:flutter_app/pages/screens/analytical_report/out_standing_schedules_report/out_standing_schedule_report_landing.dart';
import 'package:flutter_app/pages/widgets/movie_info_menu_widget.dart';

class ReportsInformationPage extends StatefulWidget {
  final LoggedInUserModel? userModel;
  final MovieModel? movieModel;
  final List<MovieModel>? movieListModel;
  final int predefinedCurrencyTypeId;
  final Uint8List? movieProfileByesData;

  const ReportsInformationPage(
      {super.key,
      required this.userModel,
      required this.movieProfileByesData,
      required this.movieModel,
      required this.predefinedCurrencyTypeId,
      required this.movieListModel});

  @override
  State<ReportsInformationPage> createState() => _ReportsInformationPageState();
}

class _ReportsInformationPageState extends State<ReportsInformationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoMenuWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OutStandingSchedulesReportLandingPage(
                                companyId: widget.userModel?.companyId,
                                movieProfileByesData:
                                    widget.movieProfileByesData,
                                predefinedCurrencyTypeId:
                                    widget.predefinedCurrencyTypeId,
                                movieId: widget.movieModel?.movieId)),
                  );
                },
                title: "Out Standing Schedules",
                imageSrcPath: AppImageAssets.note,
                key: Key("outstanding_schedules"),
              ),
              InfoMenuWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BudgetExpenseResourceTypeReport(
                              companyId: widget.userModel?.companyId ?? 0,
                              movieId: widget.movieModel?.movieId ?? 0,
                              key: widget.key,
                              predefinedCurrencyTypeId:
                                  widget.predefinedCurrencyTypeId,
                            )),
                  );
                },
                title: "Resource Type",
                imageSrcPath: AppImageAssets.resourceType,
                key: Key("resource_type"),
              ),
              InfoMenuWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BudgetExpenseDepartmentReport(
                              companyId: widget.userModel?.companyId ?? 0,
                              movieId: widget.movieModel?.movieId ?? 0,
                              key: widget.key,
                              predefinedCurrencyTypeId:
                                  widget.predefinedCurrencyTypeId,
                            )),
                  );
                },
                title: "By Department",
                imageSrcPath: AppImageAssets.buildingSvgIcon,
                key: Key("by_department"),
              ),
              InfoMenuWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BudgetExpenseMonthlyReport(
                              companyId: widget.userModel?.companyId ?? 0,
                              movieId: widget.movieModel?.movieId ?? 0,
                              key: widget.key,
                              predefinedCurrencyTypeId:
                                  widget.predefinedCurrencyTypeId,
                            )),
                  );
                },
                title: "By Monthly",
                imageSrcPath: AppImageAssets.calendarImage,
                key: Key("by_monthly"),
              ),
            ],
          ),
        ));
  }
}
