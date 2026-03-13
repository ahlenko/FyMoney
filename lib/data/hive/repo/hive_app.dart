import 'package:fymoney/data/hive/hive_const.dart';
import 'package:fymoney/data/hive/model/currency_model.dart';
import 'package:hive_ce/hive.dart';

abstract class HiveApp {
  static Future<void> setFirstLounch() async {
    var box = await Hive.openBox(HiveConst.firstLounch);
    box.put(HiveConst.firstLounch, false);
  }

  static Future<bool> getFirstLaunch() async {
    var box = await Hive.openBox(HiveConst.firstLounch);
    return box.get(HiveConst.firstLounch, defaultValue: true);
  }

  static Future<void> setLanguage(String langCode) async {
    var box = await Hive.openBox(HiveConst.language);
    box.put(HiveConst.language, langCode);
  }

  static Future<String> getLanguage() async {
    var box = await Hive.openBox(HiveConst.language);
    return box.get(HiveConst.language, defaultValue: 'en');
  }

  static Future<void> setCurrency(CurrencyModel currency) async {
    var box = await Hive.openBox<CurrencyModel>(HiveConst.currency);
    box.put(HiveConst.currency, currency);
  }

  static Future<CurrencyModel> getCurrency() async {
    var box = await Hive.openBox<CurrencyModel>(HiveConst.currency);
    return box.get(HiveConst.currency, defaultValue: CurrencyModel()) ??
        CurrencyModel();
  }
}
