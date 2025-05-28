import 'package:flutter/material.dart';

class ThemeBadgeDark extends StatelessWidget {
  final Color backgroundColor;
  final double? fontSize;
  final String badgeText;
  const ThemeBadgeDark(
      {super.key,
      required this.backgroundColor,
      required this.badgeText,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor, // Light green background
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Text(
        badgeText,
        style: TextStyle(
          fontSize: fontSize ?? 12,
          color: Colors.white, // Dark green text color
          fontWeight: FontWeight.bold, // Bold text
        ),
      ),
    );
  }
}
