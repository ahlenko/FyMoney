import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart';
import 'package:fymoney/app/navigation/router.dart';
import 'package:fymoney/app/navigation/routes.dart';
import 'package:fymoney/app/translations/messages.dart';
import 'package:fymoney/app/translations/tr_settings.dart';
import 'package:fymoney/main.dart';
import 'package:fymoney/ui/theme/theme.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

bool isFirstAppStart = false;
late BuildContext appContext;

class FyMoneyApp extends StatefulWidget {
  final bool isFirstStart;
  const FyMoneyApp({super.key, required this.isFirstStart});

  @override
  State<FyMoneyApp> createState() => _FyMoneyAppState();
}

class _FyMoneyAppState extends State<FyMoneyApp> with AfterLayoutMixin {
  Key _appKey = UniqueKey();

  @override
  void initState() {
    isFirstAppStart = widget.isFirstStart;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final state = context.read<AppSettingsCubit>().state;
    if (state.languageCode != Get.locale?.languageCode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (state.languageCode.length == 2) {
          Get.updateLocale(
            Locale(state.languageCode, state.languageCode.toUpperCase()),
          );
        } else {
          final code = state.languageCode;
          Get.updateLocale(
            Locale(
              code.substring(0, 2),
              code.substring(code.length - 2).toUpperCase(),
            ),
          );
        }
      });
    }
  }

  void _reloadApp() {
    setState(() {
      _appKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        designSize: isRunningOniPad
            ? const Size(834, 1194)
            : const Size(1080, 2460),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(boldText: false, textScaler: TextScaler.linear(1)),
            child: BlocListener<AppSettingsCubit, AppSettingsState>(
              listener: (context, state) async => {
                didChangeDependencies(),
                await Future.delayed(Duration(milliseconds: 200)),
                _reloadApp(),
              },
              child: GetMaterialApp(
                key: _appKey,
                debugShowCheckedModeBanner: false,

                // Navigation
                navigatorKey: RoutesGenerator.mainNavigatorKey,
                onGenerateRoute: RoutesGenerator.onGenerateRoute,
                initialRoute: Routes.splash,
                navigatorObservers: [customRouterObserver],

                // Localization
                locale: Get.locale,
                translations: Messages(),
                fallbackLocale: TrSettings.fallbackLocale,
                supportedLocales: TrSettings.supportedLocales,
                localizationsDelegates: TrSettings.localizationsDelegates,

                // Theme
                theme: createTheme(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    appContext = RoutesGenerator.mainNavigatorKey.currentContext!;

    if (widget.isFirstStart) {
      final deviceLocale =
          (Get.deviceLocale ?? TrSettings.fallbackLocale).languageCode;
      context.read<AppSettingsCubit>().toggleLanguage(
        !TrSettings.languages.contains(deviceLocale)
            ? TrSettings.fallbackLocale.languageCode
            : deviceLocale,
      );

      context.read<AppSettingsCubit>().saveSettings();
    }
  }
}
