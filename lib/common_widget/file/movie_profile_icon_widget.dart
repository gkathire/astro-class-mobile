import 'dart:typed_data';

import 'package:flutter_app/constant/assets.dart';
import 'package:flutter/material.dart';

class MovieProfileIconWidget extends StatelessWidget {
  final Uint8List? movieProfileByesData;
  const MovieProfileIconWidget({super.key, required this.movieProfileByesData});

  @override
  Widget build(BuildContext context) {
    return movieProfileByesData != null
        ? ClipOval(
            child: Image.memory(
              movieProfileByesData!,
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
          )
        : ClipOval(
            child: Image(
              image: AssetImage(AppImageAssets.movieDefaultIcon),
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
          );
  }
}
