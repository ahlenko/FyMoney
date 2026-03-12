import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_creation_request.freezed.dart';
part 'user_creation_request.g.dart';

@freezed
abstract class UserCreationRequest with _$UserCreationRequest {
  const factory UserCreationRequest({
    String? name,
    String? email,
    String? uid,
    String? password,
  }) = _UserCreationRequest;

  const UserCreationRequest._();

  factory UserCreationRequest.fromJson(Map<String, dynamic> json) =>
      _$UserCreationRequestFromJson(json);
}
