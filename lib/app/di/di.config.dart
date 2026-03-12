// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fymoney/app/cubits/network/network_connection_cubit.dart'
    as _i729;
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart' as _i946;
import 'package:fymoney/ui/screens/auth/auth_cubit.dart' as _i510;
import 'package:fymoney/ui/screens/home/home_cubit.dart' as _i406;
import 'package:fymoney/ui/screens/home/pages/c_settings/settings_cubit.dart'
    as _i423;
import 'package:fymoney/ui/screens/home/pages/transaction/create/create_transaction_cubit.dart'
    as _i728;
import 'package:fymoney/ui/screens/home/pages/transaction/history/history_transaction_cubit.dart'
    as _i298;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i729.NetworkConnectionCubit>(
      () => _i729.NetworkConnectionCubit(),
    );
    gh.factory<_i946.AppSettingsCubit>(() => _i946.AppSettingsCubit());
    gh.factory<_i510.AuthCubit>(() => _i510.AuthCubit());
    gh.factory<_i406.HomeCubit>(() => _i406.HomeCubit());
    gh.factory<_i423.SettingsCubit>(() => _i423.SettingsCubit());
    gh.factory<_i728.CreateTransactionCubit>(
      () => _i728.CreateTransactionCubit(),
    );
    gh.factory<_i298.HistoryTransactionCubit>(
      () => _i298.HistoryTransactionCubit(),
    );
    return this;
  }
}
