import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';

class TransactionGridStatsItem extends StatelessWidget {
  final TransactionTypeModel transactionType;
  final Function(int?) onHoverStateChanged;
  final int? hoveredIndex;
  final double percentage;
  const TransactionGridStatsItem({
    super.key,
    required this.onHoverStateChanged,
    required this.transactionType,
    required this.hoveredIndex,
    required this.percentage,
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
          width: 198.w,
          child: Column(
            children: [
              SvgPicture.asset(transactionType.icon, width: 125.w),
              Text(
                "${percentage.toStringAsFixed(1)}%",
                style: Types.segoe40Regular.copyWith(
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
