import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final TextStyle? actionStyle;

  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    this.onTap,
    this.titleStyle,
    this.actionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: titleStyle ??
              TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: actionStyle ??
                TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue, // fallback color
                ),
          ),
        ),
      ],
    );
  }
}
