import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/ui/components/button/custom_button.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/util/screen_util.dart';

class BaseDialog extends StatelessWidget {
  final String? negativeButtonText;
  final String? positiveButtonText;
  final VoidCallback? negativeButtonClick;
  final VoidCallback? positiveButtonClick;
  final String dialogTitle;
  final Widget body;
  final bool loading;

  const BaseDialog({
    super.key,
    required this.body,
    required this.dialogTitle,
    this.negativeButtonClick,
    this.negativeButtonText,
    this.positiveButtonClick,
    this.positiveButtonText,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(58.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(45.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dialogTitle,
                    style: TextStyle(fontFamily: Fonts.inter, fontSize: 55.sp),
                  ),
                  spacerVertical(40),
                  body,
                  if (negativeButtonText != null &&
                      positiveButtonText != null) ...[
                    spacerVertical(40),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            title: negativeButtonText!,
                            color: AppColors.redButton,
                            onPressed: negativeButtonClick ?? () => {},
                          ),
                        ),
                        spacerHorizontal(68),
                        Expanded(
                          child: CustomButton(
                            title: positiveButtonText!,
                            color: AppColors.darkPurple,
                            onPressed: positiveButtonClick ?? () => {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (loading)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(58.r),
                ),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
