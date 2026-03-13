import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/app/extensions/context_extension.dart';
import 'package:fymoney/app/navigation/router.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/firebase/model/transaction_model.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/components/button/custom_button.dart';
import 'package:fymoney/ui/components/fields/amount_field.dart';
import 'package:fymoney/ui/components/fields/comment_field.dart';
import 'package:fymoney/ui/components/item/transaction_grid_selectable_item.dart';
import 'package:fymoney/ui/components/navigation/navigation_app_bar.dart';
import 'package:fymoney/ui/screens/home/pages/transaction/create/create_transaction_cubit.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
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
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.selectedType == TransactionType.spending
                          ? Strings.spendingRecord.tr
                          : Strings.earningRecord.tr,
                      style: TextStyle(
                        fontFamily: Fonts.inter,
                        color: AppColors.black.withValues(alpha: .5),
                        fontSize: 50.sp,
                      ),
                    ),
                  ),
                  spacerVertical(120.h),
                  AmountField(
                    controller: TextEditingController(),
                    focusNode: FocusNode(),
                    onChanged: () => {},
                  ),
                  spacerVertical(120.h),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 75.w),
                    child: Text(
                      Strings.comment.tr,
                      style: TextStyle(
                        fontFamily: Fonts.inter,
                        color: AppColors.black.withValues(alpha: .5),
                        fontSize: 50.sp,
                      ),
                    ),
                  ),
                  spacerVertical(120.h),
                  CommentField(
                    controller: TextEditingController(),
                    focusNode: FocusNode(),
                    onChanged: () => {},
                  ),
                  spacerVertical(15.h),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 75.w),
                    child: Text(
                      widget.selectedType == TransactionType.spending
                          ? Strings.spendingCategory.tr
                          : Strings.earningCategory.tr,
                      style: TextStyle(
                        fontFamily: Fonts.inter,
                        color: AppColors.black.withValues(alpha: .5),
                        fontSize: 50.sp,
                      ),
                    ),
                  ),
                  spacerVertical(70.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: ((context.screenWidth - (3 * 310.w)) / 2).w,
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
                        onPressed: () => {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
