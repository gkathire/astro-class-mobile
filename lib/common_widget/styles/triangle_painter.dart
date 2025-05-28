import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = 50.w;
    final height = 20.h;
    final paint = Paint()
      ..color = ThemeColor.lightGreyTwo
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(width / 2, height) // Bottom center
      ..lineTo(width, 0) // Top right
      ..lineTo(0, 0) // Top left
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
