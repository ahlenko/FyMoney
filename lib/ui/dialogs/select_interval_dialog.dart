import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/model/enum/select_interval.dart';
import 'package:fymoney/ui/dialogs/base/base_dialog.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SelectIntervalDialog extends StatelessWidget {
  final SelectInterval selectedInterval;
  final Function(SelectInterval) onIntervalChanged;
  const SelectIntervalDialog({
    super.key,
    required this.onIntervalChanged,
    required this.selectedInterval,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      dialogTitle: Strings.dataSelectionRange.tr,
      body: Wrap(
        runSpacing: 50.h,

        children: SelectInterval.values
            .map(
              (el) => GestureDetector(
                onTap: () => {
                  onIntervalChanged(el),
                  Navigator.of(context).pop(),
                },
                child: Container(
                  width: 389.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: selectedInterval == el
                          ? AppColors.darkPurple
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      el.name.tr,
                      style: Types.inter48Regular.copyWith(
                        color: AppColors.black.withValues(alpha: .7),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
