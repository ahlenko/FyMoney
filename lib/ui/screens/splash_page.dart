import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fymoney/app/navigation/router.dart';
import 'package:fymoney/data/hive/repo/hive_user.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';
import 'package:fymoney/util/screen_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double progress = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        progress += 1.0;
      });

      if (progress >= 100) {
        timer.cancel();
        _navigateNext();
      }
    });
  }

  void _navigateNext() async {
    final userData = await HiveUser.getUserData(checkExistUser: true);
    final userExist = userData != null;

    Navigator.of(
      context,
    ).pushReplacementNamed(userExist ? Routes.home : Routes.auth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Vector.logoLarge, height: 500.h),
            spacerVertical(38),
            Container(
              width: 560.w,
              height: 10.h,
              decoration: BoxDecoration(
                color: AppColors.darkPurple.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  right: max(560.w - (560 * progress / 100), 0),
                ),

                decoration: BoxDecoration(
                  color: AppColors.darkPurple,
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
