import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/app/extensions/context_extension.dart';
import 'package:fymoney/app/navigation/router.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/model/enum/transaction_type.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/components/button/custom_button.dart';
import 'package:fymoney/ui/components/fields/amount_field.dart';
import 'package:fymoney/ui/components/fields/comment_field.dart';
import 'package:fymoney/ui/components/item/transaction_grid_selectable_item.dart';
import 'package:fymoney/ui/components/navigation/navigation_app_bar.dart';
import 'package:fymoney/ui/screens/home/pages/transaction/create/create_transaction_cubit.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CreateTransactionPage extends StatefulWidget {
  final TransactionType selectedType;
  const CreateTransactionPage({super.key, required this.selectedType});

  @override
  State<CreateTransactionPage> createState() => _CreateTransactionPageState();
}

class _CreateTransactionPageState extends State<CreateTransactionPage> {
  final cubit = getIt.get<CreateTransactionCubit>();

  @override
  void initState() {
    super.initState();

    cubit.emitSelectedTransaction(
      TransactionTypeModel.localTypes
          .where((transaction) => transaction.type == widget.selectedType)
          .first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: NavigationAppBar(
            sufixCallback: () => Navigator.of(
              context,
            ).pushNamed(Routes.history, arguments: widget.selectedType),
            sufixIcon: Vector.icEdit,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.selectedType == TransactionType.spending
                              ? Strings.spendingRecord.tr
                              : Strings.earningRecord.tr,
                          style: Types.inter50Regular.copyWith(
                            color: AppColors.black.withValues(alpha: .5),
                          ),
                        ),
                      ),
                      spacerVertical(120.h),
                      AmountField(
                        controller: cubit.amountController,
                        focusNode: cubit.amountNode,
                        onChanged: () => {
                          if (state.amountError != null)
                            {cubit.validateAmount()},
                        },
                      ),
                      spacerVertical(120.h),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 75.w),
                        child: Text(
                          Strings.comment.tr,
                          style: Types.inter50Regular.copyWith(
                            color: AppColors.black.withValues(alpha: .5),
                          ),
                        ),
                      ),
                      spacerVertical(120.h),
                      CommentField(
                        controller: cubit.commentController,
                        focusNode: cubit.commentNode,
                        onChanged: () => {
                          if (state.commentError != null)
                            {cubit.validateComment()},
                        },
                      ),
                      spacerVertical(15.h),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 75.w),
                        child: Text(
                          widget.selectedType == TransactionType.spending
                              ? Strings.spendingCategory.tr
                              : Strings.earningCategory.tr,
                          style: Types.inter50Regular.copyWith(
                            color: AppColors.black.withValues(alpha: .5),
                          ),
                        ),
                      ),
                      spacerVertical(70.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing:
                                ((context.screenWidth - (3 * 310.w)) / 2).w,
                            runSpacing: 40.w,
                            children: [
                              for (TransactionTypeModel transactionType
                                  in TransactionTypeModel.localTypes.where(
                                    (transaction) =>
                                        transaction.type == widget.selectedType,
                                  ))
                                TransactionGridSelectableItem(
                                  transactionType: transactionType,
                                  onTap: () => cubit.emitSelectedTransaction(
                                    transactionType,
                                  ),
                                  selectedIndex:
                                      state.selectedTransaction?.index ?? -1,
                                ),
                            ],
                          ),
                        ),
                      ),
                      spacerVertical(70.h),
                      Center(
                        child: SizedBox(
                          width: 655.w,
                          child: CustomButton(
                            title: Strings.save.tr,
                            color: AppColors.darkPurple,
                            onPressed: () => cubit.createTransaction(
                              () => Navigator.of(context).pop(),
                            ),
                          ),
                        ),
                      ),
                      spacerVertical(context.bottomSafe == 0 ? 135 : 0),
                    ],
                  ),
                ),
                if (state.loading) ...[
                  Container(
                    color: AppColors.white.withValues(alpha: .7),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
