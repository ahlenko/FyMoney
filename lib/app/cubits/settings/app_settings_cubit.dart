import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fymoney/data/hive/repo/hive_app.dart';
import 'package:injectable/injectable.dart';

part 'app_settings_state.dart';
part 'app_settings_cubit.freezed.dart';

@injectable
class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsState()) {
    _init();
  }

  void _init() async {
    toggleLanguage(await HiveApp.getLanguage());
  }

  void toggleLanguage(String languageCode) {
    emit(state.copyWith(languageCode: languageCode));
  }

  void saveSettings() async {
    HiveApp.setLanguage(state.languageCode);
    HiveApp.setFirstLounch();
  }
}
