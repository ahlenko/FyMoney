part of 'settings_cubit.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(false) bool loading,
    @Default('en') String languageCode,
    @Default([]) List<String> linkedProviders,
    @Default([]) List<CurrencyModel> availableCurrencies,
    CurrencyModel? selectedCurrency,
  }) = _SettingsState;
}
