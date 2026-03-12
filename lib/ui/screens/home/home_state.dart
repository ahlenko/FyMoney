part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(TransactionType.spending) TransactionType transactionType,
    @Default(false) bool loading,
    int? hoveredIndex,
  }) = _HomeState;
}
