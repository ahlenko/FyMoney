import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/app/extensions/context_extension.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        100.w,
        15.h,
        100.w,
        context.bottomSafe + (context.bottomSafe == 0 ? 24.h : 0.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              padding: EdgeInsets.all(45.w),
              decoration: BoxDecoration(
                color: AppColors.darkPurple,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Vector.icMinus, width: 102.w),
            ),
          ),
          SvgPicture.asset(Vector.icBurger, width: 158.w),
          GestureDetector(
            onTap: () => Scaffold.of(context).openEndDrawer(),
            child: Container(
              padding: EdgeInsets.all(45.w),
              decoration: BoxDecoration(
                color: AppColors.darkPurple,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Vector.icPlus, width: 102.w),
            ),
          ),
        ],
      ),
    );
  }
}
