// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryTransactionState {

 TransactionType get transactionType; bool get loading; bool get descendingSort; bool get sortByAmount;
/// Create a copy of HistoryTransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryTransactionStateCopyWith<HistoryTransactionState> get copyWith => _$HistoryTransactionStateCopyWithImpl<HistoryTransactionState>(this as HistoryTransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryTransactionState&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.descendingSort, descendingSort) || other.descendingSort == descendingSort)&&(identical(other.sortByAmount, sortByAmount) || other.sortByAmount == sortByAmount));
}


@override
int get hashCode => Object.hash(runtimeType,transactionType,loading,descendingSort,sortByAmount);

@override
String toString() {
  return 'HistoryTransactionState(transactionType: $transactionType, loading: $loading, descendingSort: $descendingSort, sortByAmount: $sortByAmount)';
}


}

/// @nodoc
abstract mixin class $HistoryTransactionStateCopyWith<$Res>  {
  factory $HistoryTransactionStateCopyWith(HistoryTransactionState value, $Res Function(HistoryTransactionState) _then) = _$HistoryTransactionStateCopyWithImpl;
@useResult
$Res call({
 TransactionType transactionType, bool loading, bool descendingSort, bool sortByAmount
});




}
/// @nodoc
class _$HistoryTransactionStateCopyWithImpl<$Res>
    implements $HistoryTransactionStateCopyWith<$Res> {
  _$HistoryTransactionStateCopyWithImpl(this._self, this._then);

  final HistoryTransactionState _self;
  final $Res Function(HistoryTransactionState) _then;

/// Create a copy of HistoryTransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionType = null,Object? loading = null,Object? descendingSort = null,Object? sortByAmount = null,}) {
  return _then(_self.copyWith(
transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,descendingSort: null == descendingSort ? _self.descendingSort : descendingSort // ignore: cast_nullable_to_non_nullable
as bool,sortByAmount: null == sortByAmount ? _self.sortByAmount : sortByAmount // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryTransactionState].
extension HistoryTransactionStatePatterns on HistoryTransactionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryTransactionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryTransactionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryTransactionState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryTransactionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryTransactionState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryTransactionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionType transactionType,  bool loading,  bool descendingSort,  bool sortByAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryTransactionState() when $default != null:
return $default(_that.transactionType,_that.loading,_that.descendingSort,_that.sortByAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionType transactionType,  bool loading,  bool descendingSort,  bool sortByAmount)  $default,) {final _that = this;
switch (_that) {
case _HistoryTransactionState():
return $default(_that.transactionType,_that.loading,_that.descendingSort,_that.sortByAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionType transactionType,  bool loading,  bool descendingSort,  bool sortByAmount)?  $default,) {final _that = this;
switch (_that) {
case _HistoryTransactionState() when $default != null:
return $default(_that.transactionType,_that.loading,_that.descendingSort,_that.sortByAmount);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryTransactionState implements HistoryTransactionState {
  const _HistoryTransactionState({this.transactionType = TransactionType.spending, this.loading = false, this.descendingSort = false, this.sortByAmount = false});
  

@override@JsonKey() final  TransactionType transactionType;
@override@JsonKey() final  bool loading;
@override@JsonKey() final  bool descendingSort;
@override@JsonKey() final  bool sortByAmount;

/// Create a copy of HistoryTransactionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryTransactionStateCopyWith<_HistoryTransactionState> get copyWith => __$HistoryTransactionStateCopyWithImpl<_HistoryTransactionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryTransactionState&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.descendingSort, descendingSort) || other.descendingSort == descendingSort)&&(identical(other.sortByAmount, sortByAmount) || other.sortByAmount == sortByAmount));
}


@override
int get hashCode => Object.hash(runtimeType,transactionType,loading,descendingSort,sortByAmount);

@override
String toString() {
  return 'HistoryTransactionState(transactionType: $transactionType, loading: $loading, descendingSort: $descendingSort, sortByAmount: $sortByAmount)';
}


}

/// @nodoc
abstract mixin class _$HistoryTransactionStateCopyWith<$Res> implements $HistoryTransactionStateCopyWith<$Res> {
  factory _$HistoryTransactionStateCopyWith(_HistoryTransactionState value, $Res Function(_HistoryTransactionState) _then) = __$HistoryTransactionStateCopyWithImpl;
@override @useResult
$Res call({
 TransactionType transactionType, bool loading, bool descendingSort, bool sortByAmount
});




}
/// @nodoc
class __$HistoryTransactionStateCopyWithImpl<$Res>
    implements _$HistoryTransactionStateCopyWith<$Res> {
  __$HistoryTransactionStateCopyWithImpl(this._self, this._then);

  final _HistoryTransactionState _self;
  final $Res Function(_HistoryTransactionState) _then;

/// Create a copy of HistoryTransactionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionType = null,Object? loading = null,Object? descendingSort = null,Object? sortByAmount = null,}) {
  return _then(_HistoryTransactionState(
transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,descendingSort: null == descendingSort ? _self.descendingSort : descendingSort // ignore: cast_nullable_to_non_nullable
as bool,sortByAmount: null == sortByAmount ? _self.sortByAmount : sortByAmount // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
