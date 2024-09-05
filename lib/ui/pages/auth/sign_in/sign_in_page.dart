import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/ui/pages/auth/sign_in/sign_in_page_cubit.dart';
import 'package:fymoney/ui/pages/auth/sign_in/sign_in_page_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInPageCubit, SignInPageState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
