import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: "subscriptionPeriod")
enum TransactionType {
  @JsonValue('spending')
  spending(),
  @JsonValue('earning')
  earning(),
}
