import 'package:flutter/material.dart';

import '../../../theme_data/theme_color.dart';

class VideoPlayerButton extends StatelessWidget {
  final String text;
  final IconData icon;
  const VideoPlayerButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.blueColor, size: 36),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        )
      ],
    );
  }
}
