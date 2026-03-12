import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
@HiveType(typeId: 1)
abstract class UserData with _$UserData {
  const factory UserData({
    @HiveField(0) required String documentId,
    @HiveField(1) String? name,
    @HiveField(2) String? email,
    bool? isNewUser,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
