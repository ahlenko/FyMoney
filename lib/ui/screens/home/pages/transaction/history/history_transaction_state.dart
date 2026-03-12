part of 'history_transaction_cubit.dart';

@freezed
abstract class HistoryTransactionState with _$HistoryTransactionState {
  const factory HistoryTransactionState({
    @Default(TransactionType.spending) TransactionType transactionType,
    @Default(false) bool loading,
    @Default(false) bool descendingSort,
    @Default(false) bool sortByAmount,
  }) = _HistoryTransactionState;
}
