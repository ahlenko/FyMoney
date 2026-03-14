import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fymoney/app/app.dart';
import 'package:fymoney/data/model/enum/transaction_type.dart';
import 'package:fymoney/ui/screens/home/home_cubit.dart';
import 'package:injectable/injectable.dart';

part 'history_transaction_state.dart';
part 'history_transaction_cubit.freezed.dart';

@injectable
class HistoryTransactionCubit extends Cubit<HistoryTransactionState> {
  HistoryTransactionCubit() : super(const HistoryTransactionState());

  void setPage(TransactionType transactionType) {
    emit(state.copyWith(transactionType: transactionType));
    appContext.read<HomeCubit>().setPage(transactionType);
  }

  void setSortByAmount(bool sortByAmount) {
    emit(state.copyWith(sortByAmount: sortByAmount));
  }

  void setDescendingSort(bool descending) {
    emit(state.copyWith(descendingSort: descending));
  }
}
