
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartBadge extends StatelessWidget {
  final Text labelText;
  final double size;
  final Color borderColor;
  const ChartBadge(
      {required this.labelText, required this.size, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(child: labelText),
    );
  }
}
