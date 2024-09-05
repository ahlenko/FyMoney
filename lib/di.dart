import 'package:fymoney/ui/pages/auth/password/restore_password_page_cubit.dart';
import 'package:fymoney/ui/pages/auth/sign_in/sign_in_page_cubit.dart';
import 'package:fymoney/ui/pages/auth/sign_up/sign_up_page_cubit.dart';
import 'package:fymoney/ui/pages/main/main_page_cubit.dart';
import 'package:fymoney/ui/pages/main/new_transaction/new_transaction_page_cubit.dart';
import 'package:fymoney/ui/pages/main/settings_page/settings_page_page_cubit.dart';
import 'package:fymoney/ui/pages/main/transaction_history/transaction_history_page_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  _setupCubits();
}

void _setupCubits() {
  getIt.registerFactory<RestorePasswordPageCubit>(
      () => RestorePasswordPageCubit());
  getIt.registerFactory<SignInPageCubit>(() => SignInPageCubit());
  getIt.registerFactory<SignUpPageCubit>(() => SignUpPageCubit());
  getIt.registerFactory<NewTransactionPageCubit>(
      () => NewTransactionPageCubit());
  getIt.registerFactory<SettingsPagePageCubit>(() => SettingsPagePageCubit());
  getIt.registerFactory<TransactionHistoryPageCubit>(
      () => TransactionHistoryPageCubit());
  getIt.registerFactory<MainPageCubit>(() => MainPageCubit());
}
