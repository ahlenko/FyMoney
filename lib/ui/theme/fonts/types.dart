import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';

abstract class Types {
  static final regular = FontWeight.w400;
  static final medium = FontWeight.w500;
  static final semiBold = FontWeight.w600;
  static final bold = FontWeight.w700;
  static final extraBold = FontWeight.w900;

  static TextStyle interBase = TextStyle(
    color: AppColors.white,
    fontFamily: Fonts.inter,
    fontWeight: regular,
    fontSize: 16.sp,
  );

  static TextStyle inter10Regular = interBase.copyWith(
    fontSize: 10.sp,
    fontWeight: regular,
  );
}
