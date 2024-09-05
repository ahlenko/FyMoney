import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/ui/pages/main/settings_page/settings_page_page_cubit.dart';
import 'package:fymoney/ui/pages/main/settings_page/settings_page_page_state.dart';

class SettingsPagePage extends StatefulWidget {
  const SettingsPagePage({super.key});

  @override
  State<SettingsPagePage> createState() => _SettingsPagePageState();
}

class _SettingsPagePageState extends State<SettingsPagePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsPagePageCubit, SettingsPagePageState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
