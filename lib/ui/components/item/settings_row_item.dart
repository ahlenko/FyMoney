import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/util/screen_util.dart';

class SettingsRowItem extends StatelessWidget {
  final String icon;
  final Color? tint;
  final String text;
  final VoidCallback onTap;

  const SettingsRowItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.tint,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 84.w),
            spacerHorizontal(35),
            Text(
              text,
              style: TextStyle(
                fontFamily: Fonts.inter,
                color: tint ?? AppColors.black,
                fontSize: 50.sp,
              ),
            ),
            spacerAdaptive(),
            Icon(Icons.arrow_forward_ios, color: tint ?? AppColors.darkPurple),
          ],
        ),
      ),
    );
  }
}
