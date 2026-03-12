import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/util/screen_util.dart';

class CommentField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? error;
  final VoidCallback onChanged;

  const CommentField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          maxLength: 135,
          maxLines: 3,
          onChanged: (text) => onChanged(),
          cursorColor: AppColors.purple,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 45.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide(color: AppColors.purple, width: 3.h),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide(color: AppColors.purple, width: 3.h),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide(color: AppColors.purple, width: 3.h),
            ),
          ),

          style: TextStyle(fontFamily: Fonts.inter, fontSize: 48.sp),
        ),
        if (error != null) ...[
          spacerVertical(10),
          Padding(
            padding: EdgeInsets.only(left: 45.w),
            child: Text(
              error!,
              style: TextStyle(
                fontSize: 40.sp,
                fontFamily: Fonts.segoeUI,
                color: AppColors.red,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
