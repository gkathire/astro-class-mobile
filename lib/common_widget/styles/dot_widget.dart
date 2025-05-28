import 'package:flutter/material.dart';

class DotWidget {
  static Widget getDotWidget(Color color) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
    );
  }
}
