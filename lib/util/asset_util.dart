import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fymoney/data/hive/model/currency_model.dart';

abstract class AssetUtil {
  static const currencies = 'assets/json/currency.json';

  static Future<List<CurrencyModel>> loadCurrencies() async {
    final data = await rootBundle.loadString(currencies);
    final Map<String, dynamic> jsonList = json.decode(data);
    return jsonList.entries
        .map(
          (entry) => CurrencyModel.fromJson({
            'code': entry.key,
            'symbol': entry.value['symbol'],
            'country': entry.value['country'],
          }),
        )
        .toList();
  }
}
