import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme_data/theme_color.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;
  const CustomTab(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blueColor : Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
