import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget spacerVertical(double height) {
  return SizedBox(height: height.h);
}

Widget spacerHorizontal(double width) {
  return SizedBox(width: width.w);
}

Widget spacerAdaptive() {
  return const Spacer();
}
