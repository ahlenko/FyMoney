import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/app/translations/tr_settings.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SettingsRowLanguage extends StatelessWidget {
  final String icon;
  final Color? tint;
  final String text;
  final String selectedOption;
  final Function(String?) onSelectedChanged;

  const SettingsRowLanguage({
    super.key,
    required this.icon,
    required this.text,
    required this.onSelectedChanged,
    required this.selectedOption,
    this.tint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          DropdownButton<String>(
            value: selectedOption,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: tint ?? AppColors.black,
              size: 100.sp,
            ),
            underline: const SizedBox(),
            elevation: 1,
            style: TextStyle(
              fontFamily: Fonts.inter,
              color: tint ?? AppColors.black,
              fontSize: 50.sp,
            ),
            dropdownColor: Colors.white,
            items: TrSettings.languages
                .map(
                  (lang) => DropdownMenuItem<String>(
                    value: lang,
                    child: Text(
                      lang.tr,
                      style: TextStyle(
                        fontFamily: Fonts.inter,
                        fontSize: 50.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) => onSelectedChanged(value),
          ),
        ],
      ),
    );
  }
}
