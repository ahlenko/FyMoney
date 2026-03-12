// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_creation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCreationRequest {

 String? get name; String? get email; String? get uid; String? get password;
/// Create a copy of UserCreationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCreationRequestCopyWith<UserCreationRequest> get copyWith => _$UserCreationRequestCopyWithImpl<UserCreationRequest>(this as UserCreationRequest, _$identity);

  /// Serializes this UserCreationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreationRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,uid,password);

@override
String toString() {
  return 'UserCreationRequest(name: $name, email: $email, uid: $uid, password: $password)';
}


}

/// @nodoc
abstract mixin class $UserCreationRequestCopyWith<$Res>  {
  factory $UserCreationRequestCopyWith(UserCreationRequest value, $Res Function(UserCreationRequest) _then) = _$UserCreationRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String? uid, String? password
});




}
/// @nodoc
class _$UserCreationRequestCopyWithImpl<$Res>
    implements $UserCreationRequestCopyWith<$Res> {
  _$UserCreationRequestCopyWithImpl(this._self, this._then);

  final UserCreationRequest _self;
  final $Res Function(UserCreationRequest) _then;

/// Create a copy of UserCreationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? uid = freezed,Object? password = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCreationRequest].
extension UserCreationRequestPatterns on UserCreationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCreationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCreationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCreationRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserCreationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCreationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserCreationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? email,  String? uid,  String? password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCreationRequest() when $default != null:
return $default(_that.name,_that.email,_that.uid,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? email,  String? uid,  String? password)  $default,) {final _that = this;
switch (_that) {
case _UserCreationRequest():
return $default(_that.name,_that.email,_that.uid,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? email,  String? uid,  String? password)?  $default,) {final _that = this;
switch (_that) {
case _UserCreationRequest() when $default != null:
return $default(_that.name,_that.email,_that.uid,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCreationRequest extends UserCreationRequest {
  const _UserCreationRequest({this.name, this.email, this.uid, this.password}): super._();
  factory _UserCreationRequest.fromJson(Map<String, dynamic> json) => _$UserCreationRequestFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String? uid;
@override final  String? password;

/// Create a copy of UserCreationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCreationRequestCopyWith<_UserCreationRequest> get copyWith => __$UserCreationRequestCopyWithImpl<_UserCreationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCreationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCreationRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,uid,password);

@override
String toString() {
  return 'UserCreationRequest(name: $name, email: $email, uid: $uid, password: $password)';
}


}

/// @nodoc
abstract mixin class _$UserCreationRequestCopyWith<$Res> implements $UserCreationRequestCopyWith<$Res> {
  factory _$UserCreationRequestCopyWith(_UserCreationRequest value, $Res Function(_UserCreationRequest) _then) = __$UserCreationRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? uid, String? password
});




}
/// @nodoc
class __$UserCreationRequestCopyWithImpl<$Res>
    implements _$UserCreationRequestCopyWith<$Res> {
  __$UserCreationRequestCopyWithImpl(this._self, this._then);

  final _UserCreationRequest _self;
  final $Res Function(_UserCreationRequest) _then;

/// Create a copy of UserCreationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? uid = freezed,Object? password = freezed,}) {
  return _then(_UserCreationRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
