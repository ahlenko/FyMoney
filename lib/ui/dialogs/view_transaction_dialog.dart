import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/firebase/model/transaction_model.dart';
import 'package:fymoney/data/firebase/repo/transactions_repo.dart';
import 'package:fymoney/data/model/enum/transaction_type.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/dialogs/base/base_dialog.dart';
import 'package:fymoney/ui/components/fields/amount_field.dart';
import 'package:fymoney/ui/theme/colors.dart';
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
  final amountController = TextEditingController();
  final amountNode = FocusNode();
  String? amountError;
  bool loading = false;

  @override
  initState() {
    super.initState();

    amountController.text = (widget.transaction.amount / 100).toStringAsFixed(
      2,
    );
    amountNode.addListener(() {
      if (!amountNode.hasFocus) validateAmount();
    });
  }

  validateAmount() {
    setState(() => amountError = null);

    if (amountController.text.trim().isEmpty) {
      setState(() => amountError = Strings.theFieldMustBeFilled.tr);
    } else {
      if (double.tryParse(amountController.text.trim()) == null) {
        setState(() => amountError = Strings.pleaseEnterAValidAmount.tr);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      positiveButtonText: Strings.update.tr,
      positiveButtonClick: () async {
        if (loading) return;

        validateAmount();
        if (amountError != null) return;

        setState(() => loading = true);

        try {
          await TransactionsRepo.updateTransaction(
            widget.transaction.copyWith(
              amount: (double.parse(amountController.text.trim()) * 100)
                  .toInt(),
            ),
          );
        } catch (e) {
          setState(() => loading = false);
          return;
        }

        if (mounted) Navigator.of(context).pop();
      },
      negativeButtonText: Strings.delete.tr,
      negativeButtonClick: () async {
        if (loading) return;
        setState(() => loading = true);

        try {
          await TransactionsRepo.deleteTransaction(widget.transaction.id!);
        } catch (e) {
          setState(() => loading = false);
          return;
        }

        if (mounted) Navigator.of(context).pop();
      },
      dialogTitle: widget.transaction.type == TransactionType.earning
          ? Strings.earnintData.tr
          : Strings.spendingData.tr,
      loading: loading,
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
            controller: amountController,
            focusNode: amountNode,
            onChanged: () => {
              if (amountError != null) setState(() => amountError = null),
            },
          ),
        ],
      ),
    );
  }
}
