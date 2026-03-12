import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/app/extensions/context_extension.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? prefixCallback;
  final VoidCallback sufixCallback;
  final String? prefixIcon;
  final String sufixIcon;
  const NavigationAppBar({
    super.key,
    required this.sufixCallback,
    this.prefixCallback,
    this.prefixIcon,
    required this.sufixIcon,
  });

  @override
  Size get preferredSize => Size.fromHeight(
    100.h + MediaQueryData.fromView(WidgetsBinding.instance.window).padding.top,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40.w, context.topSafe, 40.w, 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: prefixCallback ?? Navigator.of(context).pop,
            child: SvgPicture.asset(prefixIcon ?? Vector.icBack, width: 136.w),
          ),

          Expanded(
            child: Text(
              "FYMONEY",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Fonts.inter,
                fontSize: 80.sp,
                fontWeight: Types.extraBold,
                color: AppColors.purple,
              ),
            ),
          ),

          GestureDetector(
            onTap: sufixCallback,
            child: SvgPicture.asset(sufixIcon, width: 136.w),
          ),
        ],
      ),
    );
  }
}
