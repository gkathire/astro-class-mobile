import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_app/common_widget/styles/content_style.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/framework/common/utils/calculation_utils.dart';
import 'package:flutter_app/framework/common/utils/text_conversion_utils.dart';
import 'package:flutter_app/models/app_custom_model.dart';
import 'package:flutter_app/pages/fl_chart/utils/fl_chart_colors.dart';
import 'package:flutter_app/pages/fl_chart/utils/fl_chart_indicator.dart';
import 'package:flutter_app/screen_utils/color_utils.dart';
import 'package:flutter_app/screen_utils/currency_utils.dart';
import 'package:flutter_app/themedata/custom_text_scaler.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/no_data/no_data_found_widget.dart';

class FlPieChartWidget extends StatefulWidget {
  final List<MovieBudgetExpenseSummaryPieChartContainer>?
      movieBudgetExpenseCategoryList;
  final double totalAmountValue;
  final double totalBudgetAmountValue;
  final double totalExpenseAmountValue;
  final double totalPaidAmountValue;
  final String chartTitle;
  final int predefinedCurrencyTypeId;
  final int pieChartViewTypeId;
  const FlPieChartWidget(
      {super.key,
      required this.movieBudgetExpenseCategoryList,
      required this.totalAmountValue,
      required this.pieChartViewTypeId,
      required this.totalBudgetAmountValue,
      required this.totalExpenseAmountValue,
      required this.predefinedCurrencyTypeId,
      required this.totalPaidAmountValue,
      required this.chartTitle});

  @override
  State<StatefulWidget> createState() => _FlPieChartWidget();
}

class _FlPieChartWidget extends State<FlPieChartWidget> {
  int? touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: ContentStyle.contentSmallPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.chartTitle}",
                  textAlign: TextAlign.start,
                  textScaler: CustomTextScaler.headerTwo,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Text(
                  "All values are in %",
                  textAlign: TextAlign.start,
                  textScaler: CustomTextScaler.smallTextThree,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            )),
        if ((widget.movieBudgetExpenseCategoryList ?? []).isNotEmpty) ...[
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 200.h,
            child: LayoutBuilder(
              builder: (context, constrain) {
                return Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PieChart(
                        PieChartData(
                          borderData: FlBorderData(
                              show: true,
                              border: Border(top: BorderSide(width: 1))),
                          titleSunbeamLayout: true,
                          sectionsSpace: 2,
                          centerSpaceRadius: 0,
                          sections: showingSections(constrain: constrain),
                          pieTouchData: PieTouchData(
                            touchCallback: (FlTouchEvent event,
                                PieTouchResponse? response) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    response == null ||
                                    response.touchedSection == null) {
                                  touchedIndex = null;
                                  return;
                                }
                                touchedIndex = response
                                    .touchedSection!.touchedSectionIndex;
                              });
                            },
                          ),
                        ),
                      ),
                      if (touchedIndex != null && touchedIndex! >= 0) ...[
                        // Position your tooltip widget as needed.
                        Positioned(
                          top: 60
                              .h, // Adjust this to place the tooltip where you like.
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                showingSections(
                                        constrain: constrain)[touchedIndex!]
                                    .title,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 20.h),
              height: 300.h,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    for (var i = 0;
                        i < widget.movieBudgetExpenseCategoryList!.length;
                        i++) ...[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            touchedIndex = i;
                          });
                        },
                        onTapCancel: () {
                          setState(() {
                            touchedIndex = null;
                          });
                        },
                        child: FlChartIndicator(
                          color: widget
                              .movieBudgetExpenseCategoryList![i].categoryColor,
                          text: widget
                              .movieBudgetExpenseCategoryList![i].sectionName,
                          isSquare: true,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ]
                  ],
                ),
              )),
          SizedBox(
            width: 28.h,
          ),
          Container(
              padding: ContentStyle.contentSmallPadding,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Total Budget Amount : ${CurrencyConversionUtils.getFormattedCurrencyApproxValue(amount: widget.totalBudgetAmountValue, predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}",
                                textScaler: CustomTextScaler.headerThree,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Total Expense Amount : ${CurrencyConversionUtils.getFormattedCurrencyApproxValue(amount: widget.totalExpenseAmountValue, predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}",
                                textScaler: CustomTextScaler.headerThree,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Total Paid Amount : ${CurrencyConversionUtils.getFormattedCurrencyApproxValue(amount: widget.totalPaidAmountValue, predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}",
                                textScaler: CustomTextScaler.headerThree,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ] else ...[
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: NoDataFoundWidget(canShowMessage: true),
          ),
        ],
      ],
    );
  }

  List<PieChartSectionData> showingSections(
      {required BoxConstraints constrain}) {
    final shortSize = constrain.biggest.shortestSide / 2;

    return List.generate(widget.movieBudgetExpenseCategoryList?.length ?? 0,
        (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      var chartData = widget.movieBudgetExpenseCategoryList?[i];

      double chartSectionValue = 0;
      if (widget.pieChartViewTypeId == PieChartViewTypes.budgetView) {
        chartSectionValue = chartData?.totalBudgetAmount ?? 0;
      } else if (widget.pieChartViewTypeId == PieChartViewTypes.expenseView) {
        chartSectionValue = chartData?.totalExpenseAmount ?? 0;
      } else if (widget.pieChartViewTypeId == PieChartViewTypes.paidView) {
        chartSectionValue = chartData?.totalPaidAmount ?? 0;
      }

      if (chartData != null) {
        return PieChartSectionData(
          showTitle: false,
          color: chartData.categoryColor,
          badgePositionPercentageOffset: .98,
          value: CalculationUtils.getPercentageValue(
              chartSectionValue, widget.totalAmountValue),
          title:
              "${TextConversionUtils.wrapLongText(chartData.sectionName, 50)}"
              "\nAMT: ${CurrencyConversionUtils.getFormattedCurrencyActualValue(amount: chartSectionValue, predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}"
              "\nPCT: ${CalculationUtils.getPercentageValue(chartSectionValue, widget.totalAmountValue)}%",
          radius: shortSize,
          titlePositionPercentageOffset: 1.5,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: ThemeColor.black,
            shadows: shadows,
          ),
        );
      } else {
        return PieChartSectionData(
          color: ColorUtils.getRandomColor(0),
          value: 100,
          title: '100%',
          radius: shortSize,
          badgePositionPercentageOffset: .98,
          showTitle: true,
          borderSide: BorderSide(strokeAlign: BorderSide.strokeAlignOutside),
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: FlChartColors.mainTextColor1,
            shadows: shadows,
          ),
        );
      }
    });
  }
}
