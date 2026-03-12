import 'package:fymoney/data/firebase/model/user_data.dart';
import 'package:hive_ce/hive.dart';

abstract class HiveConst {
  static const String language = "language";
  static const String userData = "userData";
  static const String firstLounch = "firstLounch";

  static void registerAdapters() {
    !Hive.isAdapterRegistered(1)
        ? Hive.registerAdapter(UserDataAdapter())
        : null;
  }
}
