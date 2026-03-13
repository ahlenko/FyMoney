import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fymoney/data/firebase/model/transaction_model.dart';
import 'package:fymoney/data/firebase/repo/transactions_repo.dart';
import 'package:fymoney/data/model/enum/select_interval.dart';
import 'package:fymoney/data/model/enum/transaction_type.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  StreamSubscription<List<TransactionModel>>? transactionsSubscription;

  setTransactionsStream() async {
    cancelTransactionsStream();

    emit(state.copyWith(loading: true));
    final currentTransactions = await TransactionsRepo.getTransactions(
      state.selectInterval,
    );
    emit(state.copyWith(transactions: currentTransactions, loading: false));

    transactionsSubscription =
        TransactionsRepo.getTransactionsStream(state.selectInterval).listen((
          transactions,
        ) {
          emit(state.copyWith(transactions: transactions));
        });
  }

  cancelTransactionsStream() {
    emit(state.copyWith(transactions: []));
    transactionsSubscription?.cancel();
    transactionsSubscription = null;
  }

  changeHoverState(int? hoverIndex) {
    emit(state.copyWith(hoveredIndex: hoverIndex));
  }

  void setPage(TransactionType transactionType) {
    emit(state.copyWith(transactionType: transactionType));
  }

  void setSelectInterval(SelectInterval interval) {
    emit(state.copyWith(selectInterval: interval));
    setTransactionsStream();
  }

  @override
  Future<void> close() {
    cancelTransactionsStream();
    return super.close();
  }
}
