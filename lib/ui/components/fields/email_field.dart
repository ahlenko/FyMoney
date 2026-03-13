import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:fymoney/util/screen_util.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? error;
  final String title;
  final VoidCallback onChanged;

  const EmailField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.title,
    required this.onChanged,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 45.w),
          child: Text(title, style: Types.segoe40Regular),
        ),
        spacerVertical(10),
        TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: (text) => onChanged(),
          cursorColor: AppColors.purple,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 45.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide(color: AppColors.purple, width: 3.h),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide(color: AppColors.purple, width: 3.h),
            ),
          ),

          style: Types.inter48Regular,
        ),
        if (error != null) ...[
          spacerVertical(10),
          Padding(
            padding: EdgeInsets.only(left: 45.w),
            child: Text(
              error!,
              style: Types.segoe40Regular.copyWith(color: AppColors.red),
            ),
          ),
        ],
      ],
    );
  }
}
