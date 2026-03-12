import 'package:flutter/material.dart';
import 'package:fymoney/ui/theme/colors.dart';

ThemeData createTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
  );
}
