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
import 'package:fymoney/ui/theme/fonts/types.dart';
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
              Text(Strings.category.tr, style: Types.inter55Regular),
              spacerAdaptive(),
              Text(
                widget.type.name.tr,
                style: Types.inter55Regular.copyWith(color: widget.type.color),
              ),
              spacerHorizontal(16),
              SvgPicture.asset(widget.type.icon, width: 90.w),
            ],
          ),
          spacerVertical(24),
          Row(
            children: [
              Text(Strings.type.tr, style: Types.inter55Regular),
              spacerAdaptive(),
              Text(
                widget.transaction.type == TransactionType.earning
                    ? Strings.earning_.tr
                    : Strings.spending_.tr,
                style: Types.inter55Regular,
              ),
            ],
          ),
          spacerVertical(24),
          if (widget.transaction.createDate != null) ...[
            Row(
              children: [
                Text("${Strings.date.tr}:", style: Types.inter55Regular),
                spacerAdaptive(),
                Text(
                  DateFormat(
                    'dd MMMM yyyy',
                    'uk',
                  ).format(widget.transaction.createDate!.toLocal()),
                  style: Types.inter55Regular,
                ),
              ],
            ),
            spacerVertical(24),
          ],
          if (widget.transaction.comment.isNotEmpty) ...[
            Text(Strings.comment.tr, style: Types.inter55Regular),
            Text(
              widget.transaction.comment,
              style: Types.segoe48Regular.copyWith(
                color: AppColors.black.withValues(alpha: .5),
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
