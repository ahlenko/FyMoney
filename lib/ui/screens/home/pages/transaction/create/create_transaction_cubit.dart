import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fymoney/app/app.dart';
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/firebase/model/transaction_model.dart';
import 'package:fymoney/data/firebase/repo/transactions_repo.dart';
import 'package:fymoney/data/model/enum/transaction_type.dart';
import 'package:fymoney/data/model/transaction_type_model.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:injectable/injectable.dart';

part 'create_transaction_state.dart';
part 'create_transaction_cubit.freezed.dart';

@injectable
class CreateTransactionCubit extends Cubit<CreateTransactionState> {
  CreateTransactionCubit() : super(CreateTransactionState()) {
    amountNode.addListener(() {
      if (!amountNode.hasFocus) validateAmount();
    });
    commentNode.addListener(() {
      if (!commentNode.hasFocus) validateComment();
    });
  }

  final amountController = TextEditingController();
  final commentController = TextEditingController();

  final amountNode = FocusNode();
  final commentNode = FocusNode();

  validateAmount() {
    emit(state.copyWith(amountError: null));

    if (amountController.text.trim().isEmpty) {
      emit(state.copyWith(amountError: Strings.theFieldMustBeFilled.tr));
    } else {
      if (double.tryParse(amountController.text.trim()) == null) {
        emit(state.copyWith(amountError: Strings.pleaseEnterAValidAmount.tr));
      }
    }
  }

  validateComment() {
    emit(state.copyWith(commentError: null));

    if (commentController.text.trim().length > 135) {
      emit(
        state.copyWith(commentError: Strings.commentCantBeLongerThan135Char.tr),
      );
    }
  }

  createTransaction(VoidCallback onCreated) async {
    if (state.loading) return;
    validateAmount();
    validateComment();

    if (state.amountError != null || state.commentError != null) return;

    try {
      emit(state.copyWith(loading: true));
      await TransactionsRepo.createTransaction(
        TransactionModel(
          amount: (double.parse(amountController.text.trim()) * 100).toInt(),
          comment: commentController.text.trim(),
          currency: appContext
              .read<AppSettingsCubit>()
              .state
              .selectedCurrency
              .code,
          type: state.selectedTransaction?.type ?? TransactionType.spending,
          typeIndex: state.selectedTransaction?.index ?? 0,
          createDate: DateTime.now(),
        ),
      );
      onCreated();
    } catch (e) {
      emit(state.copyWith(loading: false));
    }
  }

  emitSelectedTransaction(TransactionTypeModel transaction) {
    emit(state.copyWith(selectedTransaction: transaction));
  }
}
