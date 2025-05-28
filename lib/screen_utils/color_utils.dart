import 'package:flutter/material.dart';

class ColorUtils {
  static Color getRandomColor(int index) {
    final chartColors = [
      Color.fromARGB(255, 64, 26, 189),
      Color.fromARGB(255, 0, 227, 150),
      Color.fromARGB(255, 255, 69, 96),
      Color.fromARGB(255, 0, 143, 251),
      Color.fromARGB(255, 246, 213, 139),
      Color.fromARGB(255, 119, 93, 208),
      Color.fromARGB(255, 82, 182, 106),
      Color.fromARGB(255, 254, 176, 25),
      Color.fromARGB(255, 255, 69, 96),
      Color.fromARGB(255, 14, 130, 156),
    ];

    var indexValue = index % 10; // last digit value
    var colorValue = chartColors[indexValue];
    return colorValue ?? Colors.blue;
  }
}
