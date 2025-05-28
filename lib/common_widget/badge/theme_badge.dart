import 'package:flutter/material.dart';

class ThemeBadge extends StatelessWidget {
  final MaterialColor backgroundColor;
  final MaterialColor textColor;
  final double? fontSize;
  final String badgeText;
  const ThemeBadge(
      {super.key,
      required this.backgroundColor,
      required this.badgeText,
      required this.textColor,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor[100], // Light green background
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Text(
        badgeText,
        style: TextStyle(
          fontSize: fontSize ?? 12,
          color: textColor[600], // Dark green text color
          fontWeight: FontWeight.bold, // Bold text
        ),
      ),
    );
  }
}
