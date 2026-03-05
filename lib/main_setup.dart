import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/data/hive/hive_const.dart';
import 'package:fymoney/main.dart';
import 'package:fymoney/util/device_util.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

mixin MainSetup {
  static init() async {
    initDi();

    await Hive.initFlutter();
    HiveConst.registerAdapters();

    await Firebase.initializeApp();

    WidgetsFlutterBinding.ensureInitialized();
    isRunningOniPad = await DeviceUtil.isRunningOniPad();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
