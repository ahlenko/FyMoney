import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:fymoney/ui/theme/colors.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  const SocialButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: AppColors.darkPurple,
        ),
        child: SvgPicture.asset(icon, width: 80.w),
      ),
    );
  }
}
