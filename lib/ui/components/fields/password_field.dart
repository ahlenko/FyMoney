import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';
import 'package:fymoney/util/screen_util.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? error;
  final String title;
  final VoidCallback onChanged;

  const PasswordField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.title,
    required this.onChanged,
    this.error,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 45.w),
          child: Text(widget.title, style: Types.segoe40Regular),
        ),
        spacerVertical(10),
        TextField(
          cursorColor: AppColors.purple,
          controller: widget.controller,
          obscureText: obscureText,
          onChanged: (text) => widget.onChanged(),
          focusNode: widget.focusNode,
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
            suffixIcon: IconButton(
              onPressed: () => {
                setState(() {
                  obscureText = !obscureText;
                }),
              },
              icon: SvgPicture.asset(
                obscureText ? Vector.eye : Vector.eyeSlash,
                color: widget.error != null ? AppColors.red : null,
              ),
            ),
          ),

          style: Types.inter48Regular,
        ),
        if (widget.error != null) ...[
          spacerVertical(10),
          Padding(
            padding: EdgeInsets.only(left: 45.w),
            child: Text(
              widget.error!,
              style: Types.segoe40Regular.copyWith(color: AppColors.red),
            ),
          ),
        ],
      ],
    );
  }
}
