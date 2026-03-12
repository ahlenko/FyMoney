// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['id'] as String?,
      currency: json['currency'] as String?,
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String? ?? "",
      type:
          $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
          TransactionType.spending,
      createDate: dateFromJson(json['createDate']),
      updateDate: dateFromJson(json['updateDate']),
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'amount': instance.amount,
      'comment': instance.comment,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'createDate': dateToJson(instance.createDate),
      'updateDate': dateToJson(instance.updateDate),
    };

const _$TransactionTypeEnumMap = {
  TransactionType.earning: 'earning',
  TransactionType.spending: 'spending',
};
