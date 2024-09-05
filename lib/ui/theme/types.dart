import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/ui/theme/colors.dart';

class Fonts {
  static const kodchasan = 'kodchasan';
  static const inter = 'inter';
}

class Types {
  static TextStyle appTitleTS = _buildTextStyle(
      weight: FontWeight.bold, size: 140.sp, color: AppColors.darkBlue);

  static TextStyle _buildTextStyle(
      {Color color = AppColors.white,
      double size = 16,
      FontWeight weight = FontWeight.w400,
      String fontFamily = Fonts.inter,
      TextDecoration? decoration,
      Color decorationColor = AppColors.white}) {
    return TextStyle(
        color: color,
        fontSize: size.sp,
        fontFamily: fontFamily,
        fontWeight: weight,
        decoration: decoration,
        decorationColor: decorationColor);
  }
}
