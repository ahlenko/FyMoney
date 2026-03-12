import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
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
  final cubit = getIt.get<HomeCubit>();

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
                    Text(
                      Strings.spending.tr,
                      style: TextStyle(
                        fontFamily: Fonts.inter,
                        color: AppColors.black.withValues(alpha: 1),
                        fontSize: 50.sp,
                      ),
                    ),
                    Text(
                      Strings.earning.tr,
                      style: TextStyle(
                        fontFamily: Fonts.inter,
                        color: AppColors.black.withValues(alpha: .5),
                        fontSize: 50.sp,
                      ),
                    ),
                  ],
                ),
                spacerVertical(60.h),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: TransactionStatsCircule(
                          segments: [
                            SegmentData(value: 40, color: Colors.blue),
                            SegmentData(value: 25, color: Colors.orange),
                            SegmentData(value: 20, color: Colors.green),
                            SegmentData(value: 20, color: Colors.black),
                            SegmentData(value: 20, color: Colors.yellow),
                            SegmentData(value: 20, color: Colors.deepOrange),
                            SegmentData(value: 20, color: Colors.pink),
                            SegmentData(value: 27, color: Colors.deepPurple),
                            SegmentData(value: 20, color: Colors.limeAccent),
                            SegmentData(value: 20, color: Colors.pinkAccent),
                          ],
                          selectedSegment: 0,
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
                      spacerVertical(76.h),
                    ],
                  ),
                ),

                spacerVertical(20.h),
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
