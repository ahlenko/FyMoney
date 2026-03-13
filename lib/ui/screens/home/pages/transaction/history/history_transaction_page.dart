import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/firebase/model/transaction_model.dart';
import 'package:fymoney/ui/components/item/transaction_history_item.dart';
import 'package:fymoney/ui/components/navigation/navigation_app_bar.dart';
import 'package:fymoney/ui/screens/home/pages/transaction/history/history_transaction_cubit.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
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
    return BlocBuilder<HistoryTransactionCubit, HistoryTransactionState>(
      bloc: cubit,
      builder: (context, state) {
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
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            TransactionHistoryItem(
                              transaction: TransactionModel(
                                typeIndex: 1,
                                comment: "fdsfs asfsdfds gsegs gers g",
                                type: .spending,
                                amount: 45356,
                                createDate: DateTime.now(),
                              ),
                            ),
                            TransactionHistoryItem(
                              transaction: TransactionModel(
                                typeIndex: 5,
                                type: .spending,
                                amount: 34123,
                                createDate: DateTime.now(),
                              ),
                            ),
                            TransactionHistoryItem(
                              transaction: TransactionModel(
                                typeIndex: 4,
                                type: .spending,
                                amount: 6594,
                                createDate: DateTime.now(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            TransactionHistoryItem(
                              transaction: TransactionModel(
                                typeIndex: 1,
                                type: .earning,
                                amount: 10000,
                                createDate: DateTime.now(),
                              ),
                            ),
                            TransactionHistoryItem(
                              transaction: TransactionModel(
                                typeIndex: 0,
                                type: .earning,
                                amount: 10000,
                                createDate: DateTime.now(),
                              ),
                            ),
                            TransactionHistoryItem(
                              transaction: TransactionModel(
                                typeIndex: 2,
                                type: .earning,
                                amount: 5000,
                                createDate: DateTime.now(),
                              ),
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
                      Text('8 травня - 11 травня', style: Types.segoe40Regular),
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
