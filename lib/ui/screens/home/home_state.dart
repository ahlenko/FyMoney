part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(TransactionType.spending) TransactionType transactionType,
    @Default(SelectInterval.week) SelectInterval selectInterval,
    @Default([]) List<TransactionModel> transactions,
    String? dateInterval,
    @Default(false) bool loading,
    int? hoveredIndex,
  }) = _HomeState;
}
