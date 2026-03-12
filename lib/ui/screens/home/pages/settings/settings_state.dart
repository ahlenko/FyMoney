part of 'settings_cubit.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({@Default(false) bool loading}) = _SettingsState;
}
