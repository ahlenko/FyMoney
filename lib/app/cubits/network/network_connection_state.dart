import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_connection_state.freezed.dart';

@freezed
abstract class NetworkConnectionState with _$NetworkConnectionState {
  const factory NetworkConnectionState({@Default(true) bool isConnected}) =
      _NetworkConnectionState;
}
