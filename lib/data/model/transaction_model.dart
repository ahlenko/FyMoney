import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fymoney/app/extensions/date_extension.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    String? id,
    String? currency,
    @Default(0) int typeIndex,
    @Default(0) int amount,
    @Default("") String comment,
    @Default(TransactionType.spending) TransactionType type,
    @JsonKey(fromJson: dateFromJson, toJson: dateToJson) DateTime? createDate,
    @JsonKey(fromJson: dateFromJson, toJson: dateToJson) DateTime? updateDate,
  }) = _TransactionModel;

  const TransactionModel._();

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

@JsonEnum(valueField: "subscriptionPeriod")
enum TransactionType {
  @JsonValue('spending')
  spending(),
  @JsonValue('earning')
  earning(),
}
