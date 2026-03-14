import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TransactionStatsCircule extends StatefulWidget {
  final List<SegmentData> segments;
  final int? selectedSegment;
  final double totalSpending;
  final double totalEarning;

  const TransactionStatsCircule({
    super.key,
    required this.segments,
    required this.selectedSegment,
    required this.totalSpending,
    required this.totalEarning,
  });

  @override
  State<TransactionStatsCircule> createState() =>
      _TransactionStatsCirculeState();
}

class _TransactionStatsCirculeState extends State<TransactionStatsCircule> {
  double get total =>
      widget.segments.fold(0, (previousValue, e) => previousValue + e.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 780.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(780.w, 780.w),
            painter: _CirclePainter(
              segments: widget.segments,
              total: total,
              selectedIndex: widget.selectedSegment,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.selectedSegment == null)
                Text(
                  '${widget.totalSpending.toStringAsFixed(2)} ${context.watch<AppSettingsCubit>().state.selectedCurrency?.symbol ?? ''}',
                  style: Types.segoe55Regular.copyWith(color: AppColors.red),
                ),
              Visibility(
                visible: widget.selectedSegment != null,
                child: Column(
                  children: [
                    Text(
                      widget
                          .segments[widget.selectedSegment ?? 0]
                          .transactionType
                          .name
                          .tr,
                      style: Types.segoe55Regular,
                    ),
                    Text(
                      '${(widget.segments[widget.selectedSegment ?? 0].value / 100).toStringAsFixed(2)} ${context.watch<AppSettingsCubit>().state.selectedCurrency?.symbol ?? ''}',
                      style: Types.segoe55Regular,
                    ),
                  ],
                ),
              ),
              if (widget.selectedSegment == null)
                Text(
                  '${widget.totalEarning.toStringAsFixed(2)} ${context.watch<AppSettingsCubit>().state.selectedCurrency?.symbol ?? ''}',
                  style: Types.segoe55Regular.copyWith(color: AppColors.green),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final List<SegmentData> segments;
  final int? selectedIndex;
  final double total;

  _CirclePainter({
    required this.segments,
    required this.total,
    required this.selectedIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const strokeWidth = 10.0;

    double startAngle = -pi / 2;

    final bgPaint = Paint()
      ..color = AppColors.gray
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final radius = size.width / 2 - 16;
    final rect = Rect.fromCircle(center: center, radius: radius);

    if (segments.isEmpty || total == 0) {
      canvas.drawArc(rect, 0, 100, false, bgPaint);
    }

    for (int i = 0; i < segments.length; i++) {
      final sweepAngle = (segments[i].value / total) * 2 * pi;

      final isSelected = i == selectedIndex;

      final radius = size.width / 2 - 16;

      final rect = Rect.fromCircle(center: center, radius: radius);

      final paint = Paint()
        ..color = segments[i].transactionType.color.withValues(
          alpha: selectedIndex == null || isSelected ? 1 : 0.4,
        )
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      final circlePaint = Paint()
        ..color = segments[i].transactionType.color.withValues(
          alpha: isSelected ? 0.24 : 0,
        )
        ..style = PaintingStyle.fill
        ..strokeWidth = strokeWidth;

      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
      canvas.drawCircle(center, radius - 5, circlePaint);

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant _CirclePainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}

class SegmentData {
  final TransactionTypeModel transactionType;
  final double value;

  const SegmentData({required this.value, required this.transactionType});
}
