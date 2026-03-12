part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool loading,
    @Default(true) bool login,
    @Default(null) String? emailError,
    @Default(null) String? passwordError,
    @Default(null) String? repeatePasswordError,
  }) = _AuthState;
}
