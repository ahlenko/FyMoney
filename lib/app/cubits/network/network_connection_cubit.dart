import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/app/cubits/network/network_connection_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class NetworkConnectionCubit extends Cubit<NetworkConnectionState> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

  NetworkConnectionCubit() : super(const NetworkConnectionState()) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final isConnected = results.any(
        (result) => result != ConnectivityResult.none,
      );
      emit(state.copyWith(isConnected: isConnected));
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
