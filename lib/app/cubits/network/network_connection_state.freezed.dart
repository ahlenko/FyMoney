// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_connection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkConnectionState {

 bool get isConnected;
/// Create a copy of NetworkConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkConnectionStateCopyWith<NetworkConnectionState> get copyWith => _$NetworkConnectionStateCopyWithImpl<NetworkConnectionState>(this as NetworkConnectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkConnectionState&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected);

@override
String toString() {
  return 'NetworkConnectionState(isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class $NetworkConnectionStateCopyWith<$Res>  {
  factory $NetworkConnectionStateCopyWith(NetworkConnectionState value, $Res Function(NetworkConnectionState) _then) = _$NetworkConnectionStateCopyWithImpl;
@useResult
$Res call({
 bool isConnected
});




}
/// @nodoc
class _$NetworkConnectionStateCopyWithImpl<$Res>
    implements $NetworkConnectionStateCopyWith<$Res> {
  _$NetworkConnectionStateCopyWithImpl(this._self, this._then);

  final NetworkConnectionState _self;
  final $Res Function(NetworkConnectionState) _then;

/// Create a copy of NetworkConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isConnected = null,}) {
  return _then(_self.copyWith(
isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkConnectionState].
extension NetworkConnectionStatePatterns on NetworkConnectionState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkConnectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkConnectionState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkConnectionState value)  $default,){
final _that = this;
switch (_that) {
case _NetworkConnectionState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkConnectionState value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkConnectionState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isConnected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkConnectionState() when $default != null:
return $default(_that.isConnected);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isConnected)  $default,) {final _that = this;
switch (_that) {
case _NetworkConnectionState():
return $default(_that.isConnected);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isConnected)?  $default,) {final _that = this;
switch (_that) {
case _NetworkConnectionState() when $default != null:
return $default(_that.isConnected);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkConnectionState implements NetworkConnectionState {
  const _NetworkConnectionState({this.isConnected = true});
  

@override@JsonKey() final  bool isConnected;

/// Create a copy of NetworkConnectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkConnectionStateCopyWith<_NetworkConnectionState> get copyWith => __$NetworkConnectionStateCopyWithImpl<_NetworkConnectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkConnectionState&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected);

@override
String toString() {
  return 'NetworkConnectionState(isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class _$NetworkConnectionStateCopyWith<$Res> implements $NetworkConnectionStateCopyWith<$Res> {
  factory _$NetworkConnectionStateCopyWith(_NetworkConnectionState value, $Res Function(_NetworkConnectionState) _then) = __$NetworkConnectionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isConnected
});




}
/// @nodoc
class __$NetworkConnectionStateCopyWithImpl<$Res>
    implements _$NetworkConnectionStateCopyWith<$Res> {
  __$NetworkConnectionStateCopyWithImpl(this._self, this._then);

  final _NetworkConnectionState _self;
  final $Res Function(_NetworkConnectionState) _then;

/// Create a copy of NetworkConnectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isConnected = null,}) {
  return _then(_NetworkConnectionState(
isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
