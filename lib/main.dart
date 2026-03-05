import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/app/app.dart';
import 'package:fymoney/app/cubits/network/network_connection_cubit.dart';
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/data/hive/repo/hive_app.dart';
import 'package:fymoney/main_setup.dart';

bool isRunningOniPad = false;

void main() async {
  await MainSetup.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<AppSettingsCubit>()),
        BlocProvider(create: (context) => getIt.get<NetworkConnectionCubit>()),
      ],
      child: FyMoneyApp(isFirstStart: await HiveApp.getFirstLaunch()),
    ),
  );
}
