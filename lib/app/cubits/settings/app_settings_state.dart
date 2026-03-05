part of 'app_settings_cubit.dart';

@freezed
abstract class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState({
    @Default({}) Map<String, Map<String, String>> translations,
    @Default('en') String languageCode,
  }) = _AppSettingsState;

  const AppSettingsState._();
}
