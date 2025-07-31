// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'khqr_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KhqrData {

 String get qr; String get md5;
/// Create a copy of KhqrData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KhqrDataCopyWith<KhqrData> get copyWith => _$KhqrDataCopyWithImpl<KhqrData>(this as KhqrData, _$identity);

  /// Serializes this KhqrData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KhqrData&&(identical(other.qr, qr) || other.qr == qr)&&(identical(other.md5, md5) || other.md5 == md5));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qr,md5);

@override
String toString() {
  return 'KhqrData(qr: $qr, md5: $md5)';
}


}

/// @nodoc
abstract mixin class $KhqrDataCopyWith<$Res>  {
  factory $KhqrDataCopyWith(KhqrData value, $Res Function(KhqrData) _then) = _$KhqrDataCopyWithImpl;
@useResult
$Res call({
 String qr, String md5
});




}
/// @nodoc
class _$KhqrDataCopyWithImpl<$Res>
    implements $KhqrDataCopyWith<$Res> {
  _$KhqrDataCopyWithImpl(this._self, this._then);

  final KhqrData _self;
  final $Res Function(KhqrData) _then;

/// Create a copy of KhqrData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? qr = null,Object? md5 = null,}) {
  return _then(_self.copyWith(
qr: null == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as String,md5: null == md5 ? _self.md5 : md5 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KhqrData].
extension KhqrDataPatterns on KhqrData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KhqrData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KhqrData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KhqrData value)  $default,){
final _that = this;
switch (_that) {
case _KhqrData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KhqrData value)?  $default,){
final _that = this;
switch (_that) {
case _KhqrData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String qr,  String md5)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KhqrData() when $default != null:
return $default(_that.qr,_that.md5);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String qr,  String md5)  $default,) {final _that = this;
switch (_that) {
case _KhqrData():
return $default(_that.qr,_that.md5);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String qr,  String md5)?  $default,) {final _that = this;
switch (_that) {
case _KhqrData() when $default != null:
return $default(_that.qr,_that.md5);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KhqrData implements KhqrData {
   _KhqrData({required this.qr, required this.md5});
  factory _KhqrData.fromJson(Map<String, dynamic> json) => _$KhqrDataFromJson(json);

@override final  String qr;
@override final  String md5;

/// Create a copy of KhqrData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KhqrDataCopyWith<_KhqrData> get copyWith => __$KhqrDataCopyWithImpl<_KhqrData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KhqrDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KhqrData&&(identical(other.qr, qr) || other.qr == qr)&&(identical(other.md5, md5) || other.md5 == md5));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qr,md5);

@override
String toString() {
  return 'KhqrData(qr: $qr, md5: $md5)';
}


}

/// @nodoc
abstract mixin class _$KhqrDataCopyWith<$Res> implements $KhqrDataCopyWith<$Res> {
  factory _$KhqrDataCopyWith(_KhqrData value, $Res Function(_KhqrData) _then) = __$KhqrDataCopyWithImpl;
@override @useResult
$Res call({
 String qr, String md5
});




}
/// @nodoc
class __$KhqrDataCopyWithImpl<$Res>
    implements _$KhqrDataCopyWith<$Res> {
  __$KhqrDataCopyWithImpl(this._self, this._then);

  final _KhqrData _self;
  final $Res Function(_KhqrData) _then;

/// Create a copy of KhqrData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? qr = null,Object? md5 = null,}) {
  return _then(_KhqrData(
qr: null == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as String,md5: null == md5 ? _self.md5 : md5 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
