// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateTransactionState {

 TransactionTypeModel? get selectedTransaction; bool get loading; String? get amountError; String? get commentError;
/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionStateCopyWith<CreateTransactionState> get copyWith => _$CreateTransactionStateCopyWithImpl<CreateTransactionState>(this as CreateTransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionState&&(identical(other.selectedTransaction, selectedTransaction) || other.selectedTransaction == selectedTransaction)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.amountError, amountError) || other.amountError == amountError)&&(identical(other.commentError, commentError) || other.commentError == commentError));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTransaction,loading,amountError,commentError);

@override
String toString() {
  return 'CreateTransactionState(selectedTransaction: $selectedTransaction, loading: $loading, amountError: $amountError, commentError: $commentError)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionStateCopyWith<$Res>  {
  factory $CreateTransactionStateCopyWith(CreateTransactionState value, $Res Function(CreateTransactionState) _then) = _$CreateTransactionStateCopyWithImpl;
@useResult
$Res call({
 TransactionTypeModel? selectedTransaction, bool loading, String? amountError, String? commentError
});




}
/// @nodoc
class _$CreateTransactionStateCopyWithImpl<$Res>
    implements $CreateTransactionStateCopyWith<$Res> {
  _$CreateTransactionStateCopyWithImpl(this._self, this._then);

  final CreateTransactionState _self;
  final $Res Function(CreateTransactionState) _then;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTransaction = freezed,Object? loading = null,Object? amountError = freezed,Object? commentError = freezed,}) {
  return _then(_self.copyWith(
selectedTransaction: freezed == selectedTransaction ? _self.selectedTransaction : selectedTransaction // ignore: cast_nullable_to_non_nullable
as TransactionTypeModel?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,amountError: freezed == amountError ? _self.amountError : amountError // ignore: cast_nullable_to_non_nullable
as String?,commentError: freezed == commentError ? _self.commentError : commentError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransactionState].
extension CreateTransactionStatePatterns on CreateTransactionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransactionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransactionState value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransactionState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionTypeModel? selectedTransaction,  bool loading,  String? amountError,  String? commentError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
return $default(_that.selectedTransaction,_that.loading,_that.amountError,_that.commentError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionTypeModel? selectedTransaction,  bool loading,  String? amountError,  String? commentError)  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionState():
return $default(_that.selectedTransaction,_that.loading,_that.amountError,_that.commentError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionTypeModel? selectedTransaction,  bool loading,  String? amountError,  String? commentError)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
return $default(_that.selectedTransaction,_that.loading,_that.amountError,_that.commentError);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTransactionState implements CreateTransactionState {
  const _CreateTransactionState({this.selectedTransaction, this.loading = false, this.amountError, this.commentError});
  

@override final  TransactionTypeModel? selectedTransaction;
@override@JsonKey() final  bool loading;
@override final  String? amountError;
@override final  String? commentError;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionStateCopyWith<_CreateTransactionState> get copyWith => __$CreateTransactionStateCopyWithImpl<_CreateTransactionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionState&&(identical(other.selectedTransaction, selectedTransaction) || other.selectedTransaction == selectedTransaction)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.amountError, amountError) || other.amountError == amountError)&&(identical(other.commentError, commentError) || other.commentError == commentError));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTransaction,loading,amountError,commentError);

@override
String toString() {
  return 'CreateTransactionState(selectedTransaction: $selectedTransaction, loading: $loading, amountError: $amountError, commentError: $commentError)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionStateCopyWith<$Res> implements $CreateTransactionStateCopyWith<$Res> {
  factory _$CreateTransactionStateCopyWith(_CreateTransactionState value, $Res Function(_CreateTransactionState) _then) = __$CreateTransactionStateCopyWithImpl;
@override @useResult
$Res call({
 TransactionTypeModel? selectedTransaction, bool loading, String? amountError, String? commentError
});




}
/// @nodoc
class __$CreateTransactionStateCopyWithImpl<$Res>
    implements _$CreateTransactionStateCopyWith<$Res> {
  __$CreateTransactionStateCopyWithImpl(this._self, this._then);

  final _CreateTransactionState _self;
  final $Res Function(_CreateTransactionState) _then;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTransaction = freezed,Object? loading = null,Object? amountError = freezed,Object? commentError = freezed,}) {
  return _then(_CreateTransactionState(
selectedTransaction: freezed == selectedTransaction ? _self.selectedTransaction : selectedTransaction // ignore: cast_nullable_to_non_nullable
as TransactionTypeModel?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,amountError: freezed == amountError ? _self.amountError : amountError // ignore: cast_nullable_to_non_nullable
as String?,commentError: freezed == commentError ? _self.commentError : commentError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
