import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/firebase/model/transaction_model.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/dialogs/base/base_dialog.dart';
import 'package:fymoney/ui/components/fields/amount_field.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

class ViewTransactionDialog extends StatefulWidget {
  final TransactionModel transaction;
  final TransactionTypeModel type;
  const ViewTransactionDialog({
    super.key,
    required this.transaction,
    required this.type,
  });

  @override
  State<ViewTransactionDialog> createState() => _ViewTransactionDialogState();
}

class _ViewTransactionDialogState extends State<ViewTransactionDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      positiveButtonText: Strings.update.tr,
      positiveButtonClick: () => {},
      negativeButtonText: Strings.delete.tr,
      negativeButtonClick: () => {},
      dialogTitle: widget.transaction.type == TransactionType.earning
          ? Strings.earnintData.tr
          : Strings.spendingData.tr,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                Strings.category.tr,
                style: TextStyle(
                  fontFamily: Fonts.inter,
                  color: AppColors.black,
                  fontSize: 55.sp,
                ),
              ),
              spacerAdaptive(),
              Text(
                widget.type.name.tr,
                style: TextStyle(
                  fontFamily: Fonts.inter,
                  color: widget.type.color,
                  fontSize: 55.sp,
                ),
              ),
              spacerHorizontal(16),
              SvgPicture.asset(widget.type.icon, width: 90.w),
            ],
          ),
          spacerVertical(24),
          Row(
            children: [
              Text(
                Strings.type.tr,
                style: TextStyle(
                  fontFamily: Fonts.inter,
                  color: AppColors.black,
                  fontSize: 55.sp,
                ),
              ),
              spacerAdaptive(),
              Text(
                widget.transaction.type == TransactionType.earning
                    ? Strings.earning_.tr
                    : Strings.spending_.tr,
                style: TextStyle(
                  fontFamily: Fonts.inter,
                  color: AppColors.black,
                  fontSize: 55.sp,
                ),
              ),
            ],
          ),
          spacerVertical(24),
          if (widget.transaction.createDate != null) ...[
            Row(
              children: [
                Text(
                  "${Strings.date.tr}:",
                  style: TextStyle(
                    fontFamily: Fonts.inter,
                    color: AppColors.black,
                    fontSize: 55.sp,
                  ),
                ),
                spacerAdaptive(),
                Text(
                  DateFormat(
                    'dd MMMM yyyy',
                    'uk',
                  ).format(widget.transaction.createDate!.toLocal()),
                  style: TextStyle(
                    fontFamily: Fonts.inter,
                    color: AppColors.black,
                    fontSize: 55.sp,
                  ),
                ),
              ],
            ),
            spacerVertical(24),
          ],
          if (widget.transaction.comment.isNotEmpty) ...[
            Text(
              Strings.comment.tr,
              style: TextStyle(
                fontFamily: Fonts.inter,
                color: AppColors.black,
                fontSize: 55.sp,
              ),
            ),
            Text(
              widget.transaction.comment,
              style: TextStyle(
                fontFamily: Fonts.segoeUI,
                color: AppColors.black.withValues(alpha: .5),
                fontSize: 48.sp,
              ),
            ),
            spacerVertical(24),
          ],
          AmountField(
            controller: TextEditingController(),
            focusNode: FocusNode(),
            onChanged: () => {},
          ),
        ],
      ),
    );
  }
}
