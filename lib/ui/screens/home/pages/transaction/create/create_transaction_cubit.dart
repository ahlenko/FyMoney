import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fymoney/data/model/transaction_model.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:injectable/injectable.dart';

part 'create_transaction_state.dart';
part 'create_transaction_cubit.freezed.dart';

@injectable
class CreateTransactionCubit extends Cubit<CreateTransactionState> {
  CreateTransactionCubit() : super(CreateTransactionState());

  emitSelectedTransaction(TransactionTypeModel transaction) {
    emit(state.copyWith(selectedTransaction: transaction));
  }
}
