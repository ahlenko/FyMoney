import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/app/extensions/context_extension.dart';
import 'package:fymoney/data/model/transaction_model.dart';
import 'package:fymoney/ui/screens/home/pages/transaction/create/create_transaction_page.dart';
import 'package:fymoney/ui/screens/home/pages/transaction/history/history_transaction_page.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';

class NavigationBottomBar extends StatelessWidget {
  final TransactionType selectedType;
  const NavigationBottomBar({super.key, required this.selectedType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        100.w,
        15.h,
        100.w,
        context.bottomSafe + (context.bottomSafe == 0 ? 24.h : 0.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CreateTransactionPage(selectedType: .spending),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeOut;

                      var tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                reverseTransitionDuration: const Duration(milliseconds: 300),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(45.w),
              decoration: BoxDecoration(
                color: AppColors.darkPurple,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Vector.icMinus, width: 102.w),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    HistoryTransactionPage(initialType: selectedType),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeOut;

                      var tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                reverseTransitionDuration: const Duration(milliseconds: 300),
              ),
            ),
            child: SvgPicture.asset(Vector.icBurger, width: 158.w),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CreateTransactionPage(selectedType: .earning),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeOut;

                      var tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                reverseTransitionDuration: const Duration(milliseconds: 300),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(45.w),
              decoration: BoxDecoration(
                color: AppColors.darkPurple,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Vector.icPlus, width: 102.w),
            ),
          ),
        ],
      ),
    );
  }
}
