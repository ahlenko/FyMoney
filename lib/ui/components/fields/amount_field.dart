import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:fymoney/util/screen_util.dart';

class AmountField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? error;
  final VoidCallback onChanged;

  const AmountField({
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
        Stack(
          children: [
            TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: (text) => onChanged(),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  final text = newValue.text;

                  if (text.isEmpty) return newValue;

                  if (text.startsWith('.') || text.startsWith(',')) {
                    return oldValue;
                  }

                  final separatorCount = '.'.allMatches(text).length;
                  if (separatorCount > 1) {
                    return oldValue;
                  }

                  final separatorIndex = text.indexOf(RegExp(r'[.]'));
                  if (separatorIndex != -1) {
                    final decimals = text.substring(separatorIndex + 1);
                    if (decimals.length > 2) {
                      return oldValue;
                    }
                  }

                  if (!RegExp(r'^[0-9.]*$').hasMatch(text)) {
                    return oldValue;
                  }

                  return newValue;
                }),
              ],
              cursorColor: AppColors.purple,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 45.w, right: 165.w),
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
              textAlign: TextAlign.center,
              style: Types.segoe55Regular,
            ),
            Positioned(
              right: 165.w,
              top: 0,
              bottom: 0,
              child: Container(
                color: AppColors.purple,
                width: 1,
                height: double.infinity,
              ),
            ),
            Positioned(
              right: 35.w,
              width: 95.w,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  '${context.watch<AppSettingsCubit>().state.selectedCurrency?.symbol ?? ''}',
                  style: Types.segoe55Regular,
                ),
              ),
            ),
          ],
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
