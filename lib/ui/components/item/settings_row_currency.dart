import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/data/hive/model/currency_model.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/util/screen_util.dart';

class SettingsRowCurrency extends StatelessWidget {
  final String icon;
  final Color? tint;
  final String text;
  final CurrencyModel selectedOption;
  final List<CurrencyModel> availableCurrencies;
  final Function(CurrencyModel?) onSelectedChanged;

  const SettingsRowCurrency({
    super.key,
    required this.icon,
    required this.text,
    required this.availableCurrencies,
    required this.onSelectedChanged,
    required this.selectedOption,
    this.tint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
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
          DropdownButton<CurrencyModel>(
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
            items: availableCurrencies
                .map(
                  (currency) => DropdownMenuItem<CurrencyModel>(
                    value: currency,
                    child: SizedBox(
                      width: 550.w,
                      child: Text(
                        '(${currency.symbol}) ${currency.country} ',
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: Fonts.inter,
                          fontSize: 50.sp,
                          color: AppColors.black,
                        ),
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
