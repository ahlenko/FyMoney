import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/ui/pages/main/transaction_history/transaction_history_page_cubit.dart';
import 'package:fymoney/ui/pages/main/transaction_history/transaction_history_page_state.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionHistoryPageCubit,
        TransactionHistoryPageState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
