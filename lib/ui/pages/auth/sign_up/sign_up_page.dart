import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/ui/pages/auth/sign_up/sign_up_page_cubit.dart';
import 'package:fymoney/ui/pages/auth/sign_up/sign_up_page_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpPageCubit, SignUpPageState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
