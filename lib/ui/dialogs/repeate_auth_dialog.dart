import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/ui/dialogs/base/base_dialog.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RepeateAuthDialog extends StatelessWidget {
  final bool providerIsGoogle;
  const RepeateAuthDialog({super.key, required this.providerIsGoogle});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      positiveButtonText: Strings.cancel.tr,
      positiveButtonClick: Navigator.of(context).pop,
      negativeButtonText: Strings.confirm.tr,
      negativeButtonClick: () => Navigator.of(context).pop(true),
      dialogTitle: Strings.confirmation.tr,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.repeateAuthWithProvider.tr.replaceFirst(
              '%provider',
              providerIsGoogle ? 'Google' : 'Apple',
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Fonts.inter,
              color: AppColors.black.withValues(alpha: .7),
              fontSize: 42.sp,
            ),
          ),
        ],
      ),
    );
  }
}
