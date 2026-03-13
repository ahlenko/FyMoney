import 'package:fymoney/data/hive/model/user_data.dart';
import 'package:fymoney/data/hive/model/currency_model.dart';
import 'package:hive_ce/hive.dart';

abstract class HiveConst {
  static const String language = "language";
  static const String userData = "userData";
  static const String firstLounch = "firstLounch";
  static const String currency = "currency";

  static void registerAdapters() {
    !Hive.isAdapterRegistered(1)
        ? Hive.registerAdapter(UserDataAdapter())
        : null;
    !Hive.isAdapterRegistered(2)
        ? Hive.registerAdapter(CurrencyModelAdapter())
        : null;
  }
}
