part of 'create_transaction_cubit.dart';

@freezed
abstract class CreateTransactionState with _$CreateTransactionState {
  const factory CreateTransactionState({
    TransactionTypeModel? selectedTransaction,
    @Default(false) bool loading,
    String? amountError,
    String? commentError,
  }) = _CreateTransactionState;
}
