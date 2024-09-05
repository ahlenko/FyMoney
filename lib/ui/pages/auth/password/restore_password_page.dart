import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/ui/pages/auth/password/restore_password_page_cubit.dart';
import 'package:fymoney/ui/pages/auth/password/restore_password_page_state.dart';

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({super.key});

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestorePasswordPageCubit, RestorePasswordPageState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
