// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettingsState {

 Map<String, Map<String, String>> get translations; String get languageCode; CurrencyModel get selectedCurrency;
/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsStateCopyWith<AppSettingsState> get copyWith => _$AppSettingsStateCopyWithImpl<AppSettingsState>(this as AppSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsState&&const DeepCollectionEquality().equals(other.translations, translations)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(translations),languageCode,selectedCurrency);

@override
String toString() {
  return 'AppSettingsState(translations: $translations, languageCode: $languageCode, selectedCurrency: $selectedCurrency)';
}


}

/// @nodoc
abstract mixin class $AppSettingsStateCopyWith<$Res>  {
  factory $AppSettingsStateCopyWith(AppSettingsState value, $Res Function(AppSettingsState) _then) = _$AppSettingsStateCopyWithImpl;
@useResult
$Res call({
 Map<String, Map<String, String>> translations, String languageCode, CurrencyModel selectedCurrency
});


$CurrencyModelCopyWith<$Res> get selectedCurrency;

}
/// @nodoc
class _$AppSettingsStateCopyWithImpl<$Res>
    implements $AppSettingsStateCopyWith<$Res> {
  _$AppSettingsStateCopyWithImpl(this._self, this._then);

  final AppSettingsState _self;
  final $Res Function(AppSettingsState) _then;

/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? translations = null,Object? languageCode = null,Object? selectedCurrency = null,}) {
  return _then(_self.copyWith(
translations: null == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, String>>,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,selectedCurrency: null == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as CurrencyModel,
  ));
}
/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyModelCopyWith<$Res> get selectedCurrency {
  
  return $CurrencyModelCopyWith<$Res>(_self.selectedCurrency, (value) {
    return _then(_self.copyWith(selectedCurrency: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppSettingsState].
extension AppSettingsStatePatterns on AppSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, Map<String, String>> translations,  String languageCode,  CurrencyModel selectedCurrency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingsState() when $default != null:
return $default(_that.translations,_that.languageCode,_that.selectedCurrency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, Map<String, String>> translations,  String languageCode,  CurrencyModel selectedCurrency)  $default,) {final _that = this;
switch (_that) {
case _AppSettingsState():
return $default(_that.translations,_that.languageCode,_that.selectedCurrency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, Map<String, String>> translations,  String languageCode,  CurrencyModel selectedCurrency)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingsState() when $default != null:
return $default(_that.translations,_that.languageCode,_that.selectedCurrency);case _:
  return null;

}
}

}

/// @nodoc


class _AppSettingsState extends AppSettingsState {
  const _AppSettingsState({final  Map<String, Map<String, String>> translations = const {}, this.languageCode = 'en', this.selectedCurrency = const CurrencyModel()}): _translations = translations,super._();
  

 final  Map<String, Map<String, String>> _translations;
@override@JsonKey() Map<String, Map<String, String>> get translations {
  if (_translations is EqualUnmodifiableMapView) return _translations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_translations);
}

@override@JsonKey() final  String languageCode;
@override@JsonKey() final  CurrencyModel selectedCurrency;

/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsStateCopyWith<_AppSettingsState> get copyWith => __$AppSettingsStateCopyWithImpl<_AppSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingsState&&const DeepCollectionEquality().equals(other._translations, _translations)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.selectedCurrency, selectedCurrency) || other.selectedCurrency == selectedCurrency));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_translations),languageCode,selectedCurrency);

@override
String toString() {
  return 'AppSettingsState(translations: $translations, languageCode: $languageCode, selectedCurrency: $selectedCurrency)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsStateCopyWith<$Res> implements $AppSettingsStateCopyWith<$Res> {
  factory _$AppSettingsStateCopyWith(_AppSettingsState value, $Res Function(_AppSettingsState) _then) = __$AppSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Map<String, String>> translations, String languageCode, CurrencyModel selectedCurrency
});


@override $CurrencyModelCopyWith<$Res> get selectedCurrency;

}
/// @nodoc
class __$AppSettingsStateCopyWithImpl<$Res>
    implements _$AppSettingsStateCopyWith<$Res> {
  __$AppSettingsStateCopyWithImpl(this._self, this._then);

  final _AppSettingsState _self;
  final $Res Function(_AppSettingsState) _then;

/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? translations = null,Object? languageCode = null,Object? selectedCurrency = null,}) {
  return _then(_AppSettingsState(
translations: null == translations ? _self._translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, String>>,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,selectedCurrency: null == selectedCurrency ? _self.selectedCurrency : selectedCurrency // ignore: cast_nullable_to_non_nullable
as CurrencyModel,
  ));
}

/// Create a copy of AppSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyModelCopyWith<$Res> get selectedCurrency {
  
  return $CurrencyModelCopyWith<$Res>(_self.selectedCurrency, (value) {
    return _then(_self.copyWith(selectedCurrency: value));
  });
}
}

// dart format on
