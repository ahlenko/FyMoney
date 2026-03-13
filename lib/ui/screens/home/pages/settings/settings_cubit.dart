import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fymoney/app/app.dart';
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart';
import 'package:fymoney/data/hive/repo/hive_app.dart';
import 'package:fymoney/util/auth_util.dart';
import 'package:injectable/injectable.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  initLanguage() async {
    emit(state.copyWith(languageCode: await HiveApp.getLanguage()));
  }

  getLinked() {
    final linked = AuthUtil.getLinkedProviders();
    emit(state.copyWith(linkedProviders: linked));
  }

  emitLanguage(String language) async {
    emit(state.copyWith(languageCode: language));
    await HiveApp.setLanguage(state.languageCode);
    appContext.read<AppSettingsCubit>().toggleLanguage(state.languageCode);
  }
}
