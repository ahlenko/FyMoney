import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:fymoney/ui/components/item/transaction_grid_stats_item.dart';
import 'package:fymoney/ui/components/item/transaction_row_stats_item.dart';
import 'package:fymoney/ui/components/navigation/navigation_app_bar.dart';
import 'package:fymoney/ui/components/navigation/navigation_bottom_bar.dart';
import 'package:fymoney/ui/components/transaction_stats_circule.dart';
import 'package:fymoney/ui/screens/home/home_cubit.dart';
import 'package:fymoney/ui/screens/home/pages/transaction/create/create_transaction_page.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<HomeState> subscription;
  late PageController _pageController;
  bool isPageAnimating = false;
  final cubit = getIt.get<HomeCubit>();

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: cubit.state.earningSelected ? 1 : 0,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      subscription = cubit.stream.listen((state) {
        if (_pageController.positions.isNotEmpty) {
          final currentIndex = _pageController.page?.round() ?? 0;
          final targetIndex = state.earningSelected ? 1 : 0;
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
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: NavigationAppBar(
            prefixCallback: () => {},
            prefixIcon: Vector.icCalendar,
            sufixCallback: () => {},
            sufixIcon: Vector.icSettings,
          ),
          drawer: CreateTransactionPage(isSpending: true),
          endDrawer: CreateTransactionPage(isSpending: false),
          bottomNavigationBar: NavigationBottomBar(),
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => cubit.setPage(0),
                      child: Text(
                        Strings.spending.tr,
                        style: TextStyle(
                          fontFamily: Fonts.inter,
                          color: AppColors.black.withValues(
                            alpha: state.earningSelected ? .5 : 1,
                          ),
                          fontSize: 50.sp,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cubit.setPage(1),
                      child: Text(
                        Strings.earning.tr,
                        style: TextStyle(
                          fontFamily: Fonts.inter,
                          color: AppColors.black.withValues(
                            alpha: !state.earningSelected ? .5 : 1,
                          ),
                          fontSize: 50.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                spacerVertical(60.h),
                Expanded(
                  child: PageView(
                    physics: state.hoveredIndex == null
                        ? BouncingScrollPhysics()
                        : NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (value) {
                      if (!isPageAnimating) {
                        cubit.setPage(value);
                      }
                    },
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: TransactionStatsCircule(
                              segments: [
                                for (TransactionTypeModel transactionType
                                    in TransactionTypeModel.localTypes.where(
                                      (transaction) =>
                                          transaction.type == .spending,
                                    ))
                                  SegmentData(
                                    value: 40,
                                    color: transactionType.color,
                                  ),
                              ],
                              selectedSegment: state.hoveredIndex,
                            ),
                          ),
                          spacerVertical(37.h),
                          Text(
                            '8 травня - 11 травня',
                            style: TextStyle(
                              fontFamily: Fonts.segoeUI,
                              color: AppColors.black,
                              fontSize: 40.sp,
                            ),
                          ),
                          spacerVertical(43.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Wrap(
                              children: [
                                for (TransactionTypeModel transactionType
                                    in TransactionTypeModel.localTypes.where(
                                      (transaction) =>
                                          transaction.type == .spending,
                                    ))
                                  TransactionGridStatsItem(
                                    onHoverStateChanged: cubit.changeHoverState,
                                    transactionType: transactionType,
                                    hoveredIndex: state.hoveredIndex,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: TransactionStatsCircule(
                              segments: [
                                for (TransactionTypeModel transactionType
                                    in TransactionTypeModel.localTypes.where(
                                      (transaction) =>
                                          transaction.type == .earning,
                                    ))
                                  SegmentData(
                                    value: 40,
                                    color: transactionType.color,
                                  ),
                              ],
                              selectedSegment: state.hoveredIndex,
                            ),
                          ),
                          spacerVertical(37.h),
                          Text(
                            '8 травня - 11 травня',
                            style: TextStyle(
                              fontFamily: Fonts.segoeUI,
                              color: AppColors.black,
                              fontSize: 40.sp,
                            ),
                          ),
                          spacerVertical(43.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              children: [
                                for (TransactionTypeModel transactionType
                                    in TransactionTypeModel.localTypes.where(
                                      (transaction) =>
                                          transaction.type == .earning,
                                    ))
                                  TransactionRowStatsItem(
                                    onHoverStateChanged: cubit.changeHoverState,
                                    transactionType: transactionType,
                                    hoveredIndex: state.hoveredIndex,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Text(
                  'Бюджет: 0,00 грн',
                  style: TextStyle(
                    fontFamily: Fonts.segoeUI,
                    color: AppColors.black,
                    fontSize: 55.sp,
                  ),
                ),
                spacerVertical(27.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
