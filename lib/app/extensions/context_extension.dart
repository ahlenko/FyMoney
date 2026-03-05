import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get topSafe => MediaQuery.of(this).padding.top;

  double get bottomSafe => MediaQuery.of(this).padding.bottom;

  double get keyboardSafe => MediaQuery.of(this).viewInsets.bottom;
}
