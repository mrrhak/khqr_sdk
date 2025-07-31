// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deeplink_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeeplinkData {

 String get shortLink;
/// Create a copy of DeeplinkData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeeplinkDataCopyWith<DeeplinkData> get copyWith => _$DeeplinkDataCopyWithImpl<DeeplinkData>(this as DeeplinkData, _$identity);

  /// Serializes this DeeplinkData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeeplinkData&&(identical(other.shortLink, shortLink) || other.shortLink == shortLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shortLink);

@override
String toString() {
  return 'DeeplinkData(shortLink: $shortLink)';
}


}

/// @nodoc
abstract mixin class $DeeplinkDataCopyWith<$Res>  {
  factory $DeeplinkDataCopyWith(DeeplinkData value, $Res Function(DeeplinkData) _then) = _$DeeplinkDataCopyWithImpl;
@useResult
$Res call({
 String shortLink
});




}
/// @nodoc
class _$DeeplinkDataCopyWithImpl<$Res>
    implements $DeeplinkDataCopyWith<$Res> {
  _$DeeplinkDataCopyWithImpl(this._self, this._then);

  final DeeplinkData _self;
  final $Res Function(DeeplinkData) _then;

/// Create a copy of DeeplinkData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shortLink = null,}) {
  return _then(_self.copyWith(
shortLink: null == shortLink ? _self.shortLink : shortLink // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeeplinkData].
extension DeeplinkDataPatterns on DeeplinkData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeeplinkData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeeplinkData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeeplinkData value)  $default,){
final _that = this;
switch (_that) {
case _DeeplinkData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeeplinkData value)?  $default,){
final _that = this;
switch (_that) {
case _DeeplinkData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String shortLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeeplinkData() when $default != null:
return $default(_that.shortLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String shortLink)  $default,) {final _that = this;
switch (_that) {
case _DeeplinkData():
return $default(_that.shortLink);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String shortLink)?  $default,) {final _that = this;
switch (_that) {
case _DeeplinkData() when $default != null:
return $default(_that.shortLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeeplinkData implements DeeplinkData {
   _DeeplinkData({required this.shortLink});
  factory _DeeplinkData.fromJson(Map<String, dynamic> json) => _$DeeplinkDataFromJson(json);

@override final  String shortLink;

/// Create a copy of DeeplinkData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeeplinkDataCopyWith<_DeeplinkData> get copyWith => __$DeeplinkDataCopyWithImpl<_DeeplinkData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeeplinkDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeeplinkData&&(identical(other.shortLink, shortLink) || other.shortLink == shortLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shortLink);

@override
String toString() {
  return 'DeeplinkData(shortLink: $shortLink)';
}


}

/// @nodoc
abstract mixin class _$DeeplinkDataCopyWith<$Res> implements $DeeplinkDataCopyWith<$Res> {
  factory _$DeeplinkDataCopyWith(_DeeplinkData value, $Res Function(_DeeplinkData) _then) = __$DeeplinkDataCopyWithImpl;
@override @useResult
$Res call({
 String shortLink
});




}
/// @nodoc
class __$DeeplinkDataCopyWithImpl<$Res>
    implements _$DeeplinkDataCopyWith<$Res> {
  __$DeeplinkDataCopyWithImpl(this._self, this._then);

  final _DeeplinkData _self;
  final $Res Function(_DeeplinkData) _then;

/// Create a copy of DeeplinkData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shortLink = null,}) {
  return _then(_DeeplinkData(
shortLink: null == shortLink ? _self.shortLink : shortLink // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
