import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/framework/services/chart/chart_badget.dart';
import 'package:astro_mobile/theme_data/custom_color.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<PieChartSectionData> showPieChartSectionsData(
    MovieShootDayBudgetExpenseSummaryForAllBudgetDivisionTypeModel?
        expenseDetail,
    int touchedIndex) {
  if (expenseDetail == null) {
    return [];
  }

  final preProductionExpenseAmont =
      expenseDetail.preProductionTotalExpenseAmount;
  final productionTotalExpenseAmount =
      expenseDetail.productionTotalExpenseAmount;
  final postProductionTotalExpenseAmount =
      expenseDetail.postProductionTotalExpenseAmount;
  final otherTotalExpenseAmount = expenseDetail.otherTotalExpenseAmount;
  if (preProductionExpenseAmont == 0 &&
      productionTotalExpenseAmount == 0 &&
      postProductionTotalExpenseAmount == 0 &&
      otherTotalExpenseAmount == 0) {
    return [];
  }

  final double? totalExpenseAmount = (preProductionExpenseAmont ?? 0) +
      (productionTotalExpenseAmount ?? 0) +
      (postProductionTotalExpenseAmount ?? 0) +
      (otherTotalExpenseAmount ?? 0);
  final preProductionExpensePercentage =
      (((preProductionExpenseAmont ?? 0) / (totalExpenseAmount ?? 0)) * 100)
          .round();
  final productionExpensePercentage =
      (((productionTotalExpenseAmount ?? 0) / (totalExpenseAmount ?? 0)) * 100)
          .round();
  final postProductionExpensePercentage =
      (((postProductionTotalExpenseAmount ?? 0) / (totalExpenseAmount ?? 0)) *
              100)
          .round();
  final otherExpenseAmountPercentage =
      (((otherTotalExpenseAmount ?? 0) / (totalExpenseAmount ?? 0)) * 100)
          .round();

  return List.generate(4, (i) {
    final isTouched = i == touchedIndex;
    final fontSize = isTouched ? 20.0 : 16.0;
    final radius = isTouched ? 110.0 : 100.0;
    final widgetSize = isTouched ? 55.0 : 40.0;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

    switch (i) {
      case 0:
        return PieChartSectionData(
          color: CustomColors.preProductionColor,
          value: preProductionExpenseAmont,
          title: '$preProductionExpensePercentage%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: ThemeColor.white,
            shadows: shadows,
          ),
          badgeWidget: ChartBadge(
            labelText: const Text("Pre Production"),
            size: widgetSize,
            borderColor: Colors.black45,
          ),
          badgePositionPercentageOffset: .98,
        );
      case 1:
        return PieChartSectionData(
          color: CustomColors.productionColor,
          value: productionTotalExpenseAmount,
          title: '$productionExpensePercentage%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
            shadows: shadows,
          ),
          badgeWidget: ChartBadge(
            labelText: const Text("Production"),
            size: widgetSize,
            borderColor: Colors.black45,
          ),
          badgePositionPercentageOffset: .98,
        );
      case 2:
        return PieChartSectionData(
          color: CustomColors.postProductionColor,
          value: postProductionTotalExpenseAmount,
          title: '$postProductionExpensePercentage%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
            shadows: shadows,
          ),
          badgeWidget: ChartBadge(
            labelText: const Text("Post Production"),
            size: widgetSize,
            borderColor: Colors.black45,
          ),
          badgePositionPercentageOffset: .98,
        );
      case 3:
        return PieChartSectionData(
          color: CustomColors.otherExpenseColor,
          value: otherTotalExpenseAmount,
          title: '$otherExpenseAmountPercentage%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
            shadows: shadows,
          ),
          badgeWidget: ChartBadge(
            labelText: const Text("Other Expense"),
            size: widgetSize,
            borderColor: Colors.black45,
          ),
          badgePositionPercentageOffset: .98,
        );
      default:
        throw Exception('Oh no');
    }
  });
}
