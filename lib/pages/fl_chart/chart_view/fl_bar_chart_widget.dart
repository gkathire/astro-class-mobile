import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_app/common_widget/loader/spinner_widget.dart';
import 'package:flutter_app/common_widget/styles/content_style.dart';
import 'package:flutter_app/common_widget/styles/dot_widget.dart';
import 'package:flutter_app/pages/fl_chart/utils/fl_chart_colors.dart';
import 'package:flutter_app/screen_utils/currency_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlChartBudgetExpensePaidSummary {
  double totalBudgetAmount;
  double totalExpenseAmount;
  double totalPaidAmount;
  FlChartBudgetExpensePaidSummary({
    required this.totalPaidAmount,
    required this.totalExpenseAmount,
    required this.totalBudgetAmount,
  });
}

class FlBarChartWidget extends StatefulWidget {
  final double maxAmountValue;
  final List<String> titles;
  final List<FlChartBudgetExpensePaidSummary> summaryList;
  final List<BarChartGroupData> rawBarGroups;
  final List<BarChartGroupData> showingBarGroups;
  final int predefinedCurrencyTypeId;
  const FlBarChartWidget(
      {super.key,
      required this.maxAmountValue,
      required this.rawBarGroups,
      required this.showingBarGroups,
      required this.summaryList,
      required this.predefinedCurrencyTypeId,
      required this.titles});
  @override
  State<StatefulWidget> createState() => _FlBarChartWidget();
}

class _FlBarChartWidget extends State<FlBarChartWidget> {
  final Color leftBarColor = FlChartColors.contentColorGreen;
  final Color middleBarColor = FlChartColors.contentColorRed;
  final Color rightBarColor = FlChartColors.contentColorBlue;
  final Color avgColor = FlChartColors.contentColorOrange;
  int touchedGroupIndex = -1;
  final double width = 7;
  int calculatedChartWidth = 0;
  double flChartHeightPercentageValue = 130;
  List<BarChartGroupData> allBarGroups = [];
  @override
  void initState() {
    super.initState();
    allBarGroups = widget.showingBarGroups;
    if (widget.titles.length < 5) {
      calculatedChartWidth = 500;
    } else {
      for (var value in widget.titles) {
        calculatedChartWidth += 100;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ContentStyle.contentSmallPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20.h,
          ),
          if (allBarGroups.isNotEmpty) ...[
            Center(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 400.h,
                width: calculatedChartWidth.w,
                child: BarChart(
                  BarChartData(
                    maxY: flChartHeightPercentageValue,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: ((group) {
                          return Colors.grey;
                        }),
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          FlChartBudgetExpensePaidSummary? summary =
                              widget.summaryList.isNotEmpty
                                  ? widget.summaryList[groupIndex]
                                  : null;
                          double amount = 0;
                          var chartLabelValue = "";
                          if (rodIndex == 0) {
                            chartLabelValue = "Budget";
                            if (summary != null) {
                              amount = summary.totalBudgetAmount;
                            }
                          } else if (rodIndex == 1) {
                            chartLabelValue = "Expense";
                            if (summary != null) {
                              amount = summary.totalExpenseAmount;
                            }
                          } else if (rodIndex == 2) {
                            chartLabelValue = "Paid";
                            if (summary != null) {
                              amount = summary.totalPaidAmount;
                            }
                          }
                          return BarTooltipItem(
                            '${widget.titles[groupIndex]}\n',
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.start,
                            children: <TextSpan>[
                              TextSpan(
                                text: '$chartLabelValue : \n',
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'PCT: ${rod.toY.toStringAsFixed(1)} % \n',
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Amt: ${CurrencyConversionUtils.getFormattedCurrencyActualValue(amount: amount, predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}',
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
                          reservedSize: 42,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          interval: 1,
                          getTitlesWidget: leftTitles,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: allBarGroups,
                    gridData: const FlGridData(show: true),
                  ),
                ),
              ),
            )),
          ] else ...[
            spinnerWidget(),
          ],
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  DotWidget.getDotWidget(FlChartColors.contentColorGreen),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("Budget"),
                ],
              ),
              SizedBox(
                width: 15.w,
              ),
              Row(
                children: [
                  DotWidget.getDotWidget(FlChartColors.contentColorRed),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("Expense"),
                ],
              ),
              SizedBox(
                width: 15.w,
              ),
              Row(
                children: [
                  DotWidget.getDotWidget(FlChartColors.contentColorBlue),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("Paid"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    double percentageValue = 0.0;
    double maxChartAmount = widget.maxAmountValue;
    String text = "";

    if (value == 5) {
      percentageValue = 0.05;
    } else if (value == 20) {
      percentageValue = 0.20;
    } else if (value == 40) {
      percentageValue = 0.40;
    } else if (value == 60) {
      percentageValue = 0.60;
    } else if (value == 80) {
      percentageValue = 0.80;
    } else if (value == 100) {
      percentageValue = 1;
    } else {
      return Container();
    }

    text = CurrencyConversionUtils.getFormattedCurrencyApproxValue(
        amount: percentageValue * maxChartAmount,
        predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId);

    return SideTitleWidget(
      meta: meta,
      space: 20.h,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.right,
          softWrap: false,
          overflow: TextOverflow.visible,
          maxLines: 1,
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final Widget text = Text(
      widget.titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return SideTitleWidget(
      meta: meta,
      space: 16, //margin top
      child: text,
    );
  }
}
