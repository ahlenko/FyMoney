import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/ui/pages/main/new_transaction/new_transaction_page_cubit.dart';
import 'package:fymoney/ui/pages/main/new_transaction/new_transaction_page_state.dart';

class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({super.key});

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTransactionPageCubit, NewTransactionPageState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
