import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

@freezed
@HiveType(typeId: 2)
abstract class CurrencyModel with _$CurrencyModel {
  const factory CurrencyModel({
    @Default("UAH") @HiveField(0) String code,
    @Default("₴") @HiveField(1) String symbol,
    @Default("Ukraine") @HiveField(2) String country,
  }) = _CurrencyModel;

  const CurrencyModel._();

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CurrencyModel && other.code == code;
}
