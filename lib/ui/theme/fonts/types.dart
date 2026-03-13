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
    color: AppColors.black,
    fontFamily: Fonts.inter,
    fontWeight: regular,
    fontSize: 40.sp,
  );

  static TextStyle inter40Regular = interBase.copyWith(fontWeight: regular);

  static TextStyle inter42Regular = interBase.copyWith(
    fontSize: 42.sp,
    fontWeight: regular,
  );

  static TextStyle inter46Regular = interBase.copyWith(
    fontSize: 46.sp,
    fontWeight: regular,
  );

  static TextStyle inter48Regular = interBase.copyWith(
    fontSize: 48.sp,
    fontWeight: regular,
  );

  static TextStyle inter50Regular = interBase.copyWith(
    fontSize: 50.sp,
    fontWeight: regular,
  );

  static TextStyle inter55Regular = interBase.copyWith(
    fontSize: 55.sp,
    fontWeight: regular,
  );

  static TextStyle inter60Regular = interBase.copyWith(
    fontSize: 60.sp,
    fontWeight: regular,
  );

  static TextStyle inter70Regular = interBase.copyWith(
    fontSize: 70.sp,
    fontWeight: regular,
  );
  static TextStyle inter80ExtraBold = interBase.copyWith(
    fontSize: 80.sp,
    fontWeight: extraBold,
  );

  static TextStyle segoeBase = TextStyle(
    color: AppColors.black,
    fontFamily: Fonts.segoeUI,
    fontWeight: regular,
    fontSize: 40.sp,
  );

  static TextStyle segoe40Regular = segoeBase.copyWith(
    fontSize: 40.sp,
    fontWeight: regular,
  );

  static TextStyle segoe48Regular = segoeBase.copyWith(
    fontSize: 48.sp,
    fontWeight: regular,
  );

  static TextStyle segoe55Regular = segoeBase.copyWith(
    fontSize: 55.sp,
    fontWeight: regular,
  );
}
