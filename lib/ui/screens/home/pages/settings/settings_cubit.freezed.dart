// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsState {

 bool get loading; String? get languageCode; List<String> get linkedProviders; List<CurrencyModel> get availableCurrencies; CurrencyModel? get selectedCurrency;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&const DeepCollectionEquality().equals(other.linkedProviders, linkedProviders)&&const DeepCollectionEquality().equals(other.availableCurrencies, availableCurrencies)&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency));
}


@override
int get hashCode => Object.hash(runtimeType,loading,languageCode,const DeepCollectionEquality().hash(linkedProviders),const DeepCollectionEquality().hash(availableCurrencies),selectedCurrency);

@override
String toString() {
  return 'SettingsState(loading: $loading, languageCode: $languageCode, linkedProviders: $linkedProviders, availableCurrencies: $availableCurrencies, selectedCurrency: $selectedCurrency)';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 bool loading, String? languageCode, List<String> linkedProviders, List<CurrencyModel> availableCurrencies, CurrencyModel? selectedCurrency
});


$CurrencyModelCopyWith<$Res>? get selectedCurrency;

}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? languageCode = freezed,Object? linkedProviders = null,Object? availableCurrencies = null,Object? selectedCurrency = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,languageCode: freezed == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String?,linkedProviders: null == linkedProviders ? _self.linkedProviders : linkedProviders // ignore: cast_nullable_to_non_nullable
as List<String>,availableCurrencies: null == availableCurrencies ? _self.availableCurrencies : availableCurrencies // ignore: cast_nullable_to_non_nullable
as List<CurrencyModel>,selectedCurrency: freezed == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as CurrencyModel?,
  ));
}
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyModelCopyWith<$Res>? get selectedCurrency {
    if (_self.selectedCurrency == null) {
    return null;
  }

  return $CurrencyModelCopyWith<$Res>(_self.selectedCurrency!, (value) {
    return _then(_self.copyWith(selectedCurrency: value));
  });
}
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  String? languageCode,  List<String> linkedProviders,  List<CurrencyModel> availableCurrencies,  CurrencyModel? selectedCurrency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.loading,_that.languageCode,_that.linkedProviders,_that.availableCurrencies,_that.selectedCurrency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  String? languageCode,  List<String> linkedProviders,  List<CurrencyModel> availableCurrencies,  CurrencyModel? selectedCurrency)  $default,) {final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that.loading,_that.languageCode,_that.linkedProviders,_that.availableCurrencies,_that.selectedCurrency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  String? languageCode,  List<String> linkedProviders,  List<CurrencyModel> availableCurrencies,  CurrencyModel? selectedCurrency)?  $default,) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.loading,_that.languageCode,_that.linkedProviders,_that.availableCurrencies,_that.selectedCurrency);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsState implements SettingsState {
  const _SettingsState({this.loading = false, this.languageCode, final  List<String> linkedProviders = const [], final  List<CurrencyModel> availableCurrencies = const [], this.selectedCurrency}): _linkedProviders = linkedProviders,_availableCurrencies = availableCurrencies;
  

@override@JsonKey() final  bool loading;
@override final  String? languageCode;
 final  List<String> _linkedProviders;
@override@JsonKey() List<String> get linkedProviders {
  if (_linkedProviders is EqualUnmodifiableListView) return _linkedProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_linkedProviders);
}

 final  List<CurrencyModel> _availableCurrencies;
@override@JsonKey() List<CurrencyModel> get availableCurrencies {
  if (_availableCurrencies is EqualUnmodifiableListView) return _availableCurrencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableCurrencies);
}

@override final  CurrencyModel? selectedCurrency;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&const DeepCollectionEquality().equals(other._linkedProviders, _linkedProviders)&&const DeepCollectionEquality().equals(other._availableCurrencies, _availableCurrencies)&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency));
}


@override
int get hashCode => Object.hash(runtimeType,loading,languageCode,const DeepCollectionEquality().hash(_linkedProviders),const DeepCollectionEquality().hash(_availableCurrencies),selectedCurrency);

@override
String toString() {
  return 'SettingsState(loading: $loading, languageCode: $languageCode, linkedProviders: $linkedProviders, availableCurrencies: $availableCurrencies, selectedCurrency: $selectedCurrency)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, String? languageCode, List<String> linkedProviders, List<CurrencyModel> availableCurrencies, CurrencyModel? selectedCurrency
});


@override $CurrencyModelCopyWith<$Res>? get selectedCurrency;

}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? languageCode = freezed,Object? linkedProviders = null,Object? availableCurrencies = null,Object? selectedCurrency = freezed,}) {
  return _then(_SettingsState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,languageCode: freezed == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String?,linkedProviders: null == linkedProviders ? _self._linkedProviders : linkedProviders // ignore: cast_nullable_to_non_nullable
as List<String>,availableCurrencies: null == availableCurrencies ? _self._availableCurrencies : availableCurrencies // ignore: cast_nullable_to_non_nullable
as List<CurrencyModel>,selectedCurrency: freezed == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as CurrencyModel?,
  ));
}

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyModelCopyWith<$Res>? get selectedCurrency {
    if (_self.selectedCurrency == null) {
    return null;
  }

  return $CurrencyModelCopyWith<$Res>(_self.selectedCurrency!, (value) {
    return _then(_self.copyWith(selectedCurrency: value));
  });
}
}

// dart format on
