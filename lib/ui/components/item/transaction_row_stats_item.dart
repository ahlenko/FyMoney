import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/utils.dart';

class TransactionRowStatsItem extends StatelessWidget {
  final TransactionTypeModel transactionType;
  final Function(int?) onHoverStateChanged;
  final int? hoveredIndex;
  const TransactionRowStatsItem({
    super.key,
    required this.onHoverStateChanged,
    required this.transactionType,
    required this.hoveredIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => {onHoverStateChanged(transactionType.index)},
      onTapUp: (details) => {onHoverStateChanged(null)},
      onPanEnd: (details) => {onHoverStateChanged(null)},
      child: Container(
        margin: EdgeInsets.all(6.w),
        padding: EdgeInsets.symmetric(vertical: 21.h),
        decoration: BoxDecoration(
          color: transactionType.color.withValues(
            alpha: hoveredIndex == transactionType.index ? 0.3 : 0,
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: SizedBox(
          height: 190.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                SvgPicture.asset(transactionType.icon, width: 125.w),
                spacerHorizontal(46.w),
                Expanded(
                  child: Text(
                    transactionType.name.tr,
                    style: Types.segoe55Regular.copyWith(
                      color: transactionType.color,
                    ),
                  ),
                ),
                spacerHorizontal(46.w),
                Text(
                  "22%",
                  style: Types.segoe55Regular.copyWith(
                    color: transactionType.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
