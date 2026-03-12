// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_creation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCreationRequest _$UserCreationRequestFromJson(Map<String, dynamic> json) =>
    _UserCreationRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      uid: json['uid'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserCreationRequestToJson(
  _UserCreationRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'uid': instance.uid,
  'password': instance.password,
};
