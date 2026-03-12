import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TransactionGridSelectableItem extends StatelessWidget {
  final TransactionTypeModel transactionType;
  final VoidCallback onTap;
  final int selectedIndex;
  const TransactionGridSelectableItem({
    super.key,
    required this.onTap,
    required this.transactionType,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selectedIndex == transactionType.index
                ? AppColors.darkPurple
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: SizedBox(
          height: 215.h,
          width: 310.w,
          child: Column(
            children: [
              SvgPicture.asset(transactionType.icon, width: 125.w),
              Text(
                transactionType.name.tr,
                style: TextStyle(
                  fontFamily: Fonts.segoeUI,
                  fontSize: 40.sp,
                  color: transactionType.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
