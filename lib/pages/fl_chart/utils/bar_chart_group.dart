import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';

class BarChartGroupUtils {
  static BarChartGroupData makeGroupData({
    required int x,
    required double y1,
    required double y2,
    required double y3,
    required double width,
    required Color leftBarColor,
    required Color middleBarColor,
    required Color rightBarColor,
  }) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: middleBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y3,
          color: rightBarColor,
          width: width,
        ),
      ],
    );
  }
}
