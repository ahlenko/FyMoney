import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart';
import 'package:fymoney/data/firebase/model/transaction_model.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/dialogs/view_transaction_dialog.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/utils.dart';

class TransactionHistoryItem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionHistoryItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final transactionType = transaction.type == .earning
        ? TransactionTypeModel.localTypes
              .where((transaction) => transaction.type == .earning)
              .firstWhere((tr) => tr.index == transaction.typeIndex)
        : TransactionTypeModel.localTypes
              .where((transaction) => transaction.type == .spending)
              .firstWhere((tr) => tr.index == transaction.typeIndex);

    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => ViewTransactionDialog(
          transaction: transaction,
          type: transactionType,
        ),
      ),
      child: Container(
        color: Colors.transparent,

        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          children: [
            SvgPicture.asset(transactionType.icon, width: 108.w),
            spacerHorizontal(42.w),
            Expanded(
              child: Text(
                transactionType.name.tr,
                style: TextStyle(
                  fontFamily: Fonts.segoeUI,
                  fontSize: 55.sp,
                  color: transactionType.color,
                ),
              ),
            ),
            spacerHorizontal(46.w),
            Text(
              "${(transaction.amount / 100).toStringAsFixed(2)} ${context.watch<AppSettingsCubit>().state.selectedCurrency?.symbol ?? ''}",
              style: TextStyle(
                fontFamily: Fonts.segoeUI,
                fontSize: 55.sp,
                color: AppColors.black.withValues(alpha: .7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
