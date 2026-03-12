import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        surfaceTintColor: WidgetStatePropertyAll(color),
        backgroundColor: WidgetStatePropertyAll(color),
      ),
      onPressed: onPressed,
      child: AutoSizeText(
        title,
        maxLines: 1,
        style: TextStyle(fontFamily: Fonts.inter, fontSize: 60.sp),
      ),
    );
  }
}
