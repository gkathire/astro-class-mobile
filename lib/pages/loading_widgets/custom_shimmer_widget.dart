import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shimmer/shimmer.dart';

// ignore: deprecated_member_use
 var brightness = SchedulerBinding.instance.window.platformBrightness;
 bool isDarkMode = brightness == Brightness.dark;
class CustomShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  const CustomShimmerWidget.rectangular(
      {super.key, required this.width, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const CustomShimmerWidget.circular(
      {super.key, required this.width,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: isDarkMode?Color.fromARGB(255, 177, 137, 137):Color.fromARGB(255, 193, 26, 26),
          shape: shapeBorder,
        ),
      ),
      // baseColor: Colors.red,
      baseColor: isDarkMode?Color.fromARGB(255, 174, 74, 38):Color.fromARGB(255, 174, 174, 174),
      // highlightColor: Colors.blue,
      highlightColor: Colors.grey,
      period: const Duration(seconds: 1),
    );
  }
}