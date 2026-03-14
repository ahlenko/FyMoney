import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/app/navigation/router.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/firebase/model/transaction_model.dart';
import 'package:fymoney/data/model/enum/transaction_type.dart';
import 'package:fymoney/ui/components/button/custom_button.dart';
import 'package:fymoney/ui/components/item/transaction_history_item.dart';
import 'package:fymoney/ui/components/navigation/navigation_app_bar.dart';
import 'package:fymoney/ui/screens/home/home_cubit.dart';
import 'package:fymoney/ui/screens/home/pages/transaction/history/history_transaction_cubit.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HistoryTransactionPage extends StatefulWidget {
  final TransactionType initialType;
  const HistoryTransactionPage({super.key, required this.initialType});

  @override
  State<HistoryTransactionPage> createState() => _HistoryTransactionPageState();
}

class _HistoryTransactionPageState extends State<HistoryTransactionPage> {
  late StreamSubscription<HistoryTransactionState> subscription;
  late PageController _pageController;
  bool isPageAnimating = false;

  final cubit = getIt.get<HistoryTransactionCubit>();

  @override
  void initState() {
    super.initState();

    cubit.setPage(widget.initialType);
    _pageController = PageController(initialPage: widget.initialType.index);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      subscription = cubit.stream.listen((state) {
        if (_pageController.positions.isNotEmpty) {
          final currentIndex = _pageController.page?.round() ?? 0;
          final targetIndex = state.transactionType.index;
          final distance = (targetIndex - currentIndex).abs();

          final duration = Duration(milliseconds: distance * 200);

          isPageAnimating = true;
          _pageController
              .animateToPage(
                targetIndex,
                duration: duration > Duration.zero
                    ? duration
                    : const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              )
              .then((_) => isPageAnimating = false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionsList = context.watch<HomeCubit>().state.transactions;

    return BlocBuilder<HistoryTransactionCubit, HistoryTransactionState>(
      bloc: cubit,
      builder: (context, state) {
        final sortedTransactions = List<TransactionModel>.from(transactionsList)
          ..sort((a, b) {
            int compare;
            if (state.sortByAmount) {
              compare = a.amount.compareTo(b.amount);
            } else {
              compare = a.createDate!.compareTo(b.createDate!);
            }
            return state.descendingSort ? -compare : compare;
          });

        return Scaffold(
          appBar: NavigationAppBar(
            sufixCallback: () => cubit.setDescendingSort(!state.descendingSort),
            sufixIcon: state.descendingSort
                ? Vector.icSortDown
                : Vector.icSortUp,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => cubit.setPage(.spending),
                      child: Text(
                        Strings.spending.tr,
                        style: Types.inter50Regular.copyWith(
                          color: AppColors.black.withValues(
                            alpha: state.transactionType == .earning ? .5 : 1,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cubit.setPage(.earning),
                      child: Text(
                        Strings.earning.tr,
                        style: Types.inter50Regular.copyWith(
                          color: AppColors.black.withValues(
                            alpha: state.transactionType == .spending ? .5 : 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                spacerVertical(60.h),
                Expanded(
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (value) {
                      if (!isPageAnimating) {
                        cubit.setPage(TransactionType.values[value]);
                      }
                    },
                    children: [
                      sortedTransactions
                              .where((t) => t.type == .spending)
                              .isEmpty
                          ? Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    Strings.noSpendingsFound.tr,
                                    style: Types.segoe40Regular,
                                  ),
                                  spacerVertical(45),
                                  CustomButton(
                                    title: Strings.addFirstSpending.tr,
                                    color: AppColors.darkPurple,
                                    onPressed: () => {
                                      Navigator.of(
                                        context,
                                      ).pushReplacementNamed(
                                        Routes.create,
                                        arguments: TransactionType.spending,
                                      ),
                                    },
                                  ),
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (var transaction
                                      in sortedTransactions.where(
                                        (t) => t.type == .spending,
                                      ))
                                    TransactionHistoryItem(
                                      transaction: transaction,
                                    ),
                                ],
                              ),
                            ),
                      sortedTransactions
                              .where((t) => t.type == .earning)
                              .isEmpty
                          ? Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    Strings.noEarningsFound.tr,
                                    style: Types.segoe40Regular,
                                  ),
                                  spacerVertical(45),
                                  CustomButton(
                                    title: Strings.addFirstEarning.tr,
                                    color: AppColors.darkPurple,
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacementNamed(
                                          Routes.create,
                                          arguments: TransactionType.earning,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (var transaction
                                      in sortedTransactions.where(
                                        (t) => t.type == .earning,
                                      ))
                                    TransactionHistoryItem(
                                      transaction: transaction,
                                    ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 85.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => cubit.setSortByAmount(false),
                        child: Text(
                          Strings.date.tr,
                          style: Types.segoe40Regular.copyWith(
                            color: AppColors.black.withValues(
                              alpha: !state.sortByAmount ? 1 : .5,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        context.watch<HomeCubit>().state.dateInterval ?? '',
                        style: Types.segoe40Regular,
                      ),
                      GestureDetector(
                        onTap: () => cubit.setSortByAmount(true),
                        child: Text(
                          Strings.amount.tr,
                          style: Types.segoe40Regular.copyWith(
                            color: AppColors.black.withValues(
                              alpha: state.sortByAmount ? 1 : .5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
