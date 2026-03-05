import 'package:flutter/material.dart';
import 'package:fymoney/ui/theme/colors.dart';

ThemeData createTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
  );
}