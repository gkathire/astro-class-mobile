import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension SpaceUtils on num {
  SizedBox get ph => SizedBox(
        height: h,
      );
  SizedBox get pw => SizedBox(
        width: w,
      );
}
