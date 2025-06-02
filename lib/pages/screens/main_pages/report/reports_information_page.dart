import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:astro_mobile/api/generated/code/astroclass.swagger.dart';
import 'package:astro_mobile/constant/assets.dart';

class ReportsInformationPage extends StatefulWidget {
  final LoggedInUserModel? userModel;
  final int predefinedCurrencyTypeId;

  const ReportsInformationPage({
    super.key,
    required this.userModel,
    required this.predefinedCurrencyTypeId,
  });

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
                  // on tab
                },
                title: "Out Standing Schedules",
                imageSrcPath: AppImageAssets.note,
                key: Key("outstanding_schedules"),
              ),
              InfoMenuWidget(
                onTap: () {
                  //
                },
                title: "Resource Type",
                imageSrcPath: AppImageAssets.resourceType,
                key: Key("resource_type"),
              ),
              InfoMenuWidget(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => BudgetExpenseDepartmentReport(
                  //             companyId: widget.userModel?.companyId ?? 0,
                  //             key: widget.key,
                  //             predefinedCurrencyTypeId:
                  //                 widget.predefinedCurrencyTypeId,
                  //           )),
                  // );
                },
                title: "By Department",
                imageSrcPath: AppImageAssets.buildingSvgIcon,
                key: Key("by_department"),
              ),
              InfoMenuWidget(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => BudgetExpenseMonthlyReport(
                  //             companyId: widget.userModel?.companyId ?? 0,
                  //             key: widget.key,
                  //             predefinedCurrencyTypeId:
                  //                 widget.predefinedCurrencyTypeId,
                  //           )),
                  // );
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
