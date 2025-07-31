// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SourceInfo {

 String get appIconUrl; String get appName; String get appDeepLinkCallBack;
/// Create a copy of SourceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceInfoCopyWith<SourceInfo> get copyWith => _$SourceInfoCopyWithImpl<SourceInfo>(this as SourceInfo, _$identity);

  /// Serializes this SourceInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceInfo&&(identical(other.appIconUrl, appIconUrl) || other.appIconUrl == appIconUrl)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.appDeepLinkCallBack, appDeepLinkCallBack) || other.appDeepLinkCallBack == appDeepLinkCallBack));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appIconUrl,appName,appDeepLinkCallBack);

@override
String toString() {
  return 'SourceInfo(appIconUrl: $appIconUrl, appName: $appName, appDeepLinkCallBack: $appDeepLinkCallBack)';
}


}

/// @nodoc
abstract mixin class $SourceInfoCopyWith<$Res>  {
  factory $SourceInfoCopyWith(SourceInfo value, $Res Function(SourceInfo) _then) = _$SourceInfoCopyWithImpl;
@useResult
$Res call({
 String appIconUrl, String appName, String appDeepLinkCallBack
});




}
/// @nodoc
class _$SourceInfoCopyWithImpl<$Res>
    implements $SourceInfoCopyWith<$Res> {
  _$SourceInfoCopyWithImpl(this._self, this._then);

  final SourceInfo _self;
  final $Res Function(SourceInfo) _then;

/// Create a copy of SourceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appIconUrl = null,Object? appName = null,Object? appDeepLinkCallBack = null,}) {
  return _then(_self.copyWith(
appIconUrl: null == appIconUrl ? _self.appIconUrl : appIconUrl // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,appDeepLinkCallBack: null == appDeepLinkCallBack ? _self.appDeepLinkCallBack : appDeepLinkCallBack // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceInfo].
extension SourceInfoPatterns on SourceInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceInfo value)  $default,){
final _that = this;
switch (_that) {
case _SourceInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SourceInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String appIconUrl,  String appName,  String appDeepLinkCallBack)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceInfo() when $default != null:
return $default(_that.appIconUrl,_that.appName,_that.appDeepLinkCallBack);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String appIconUrl,  String appName,  String appDeepLinkCallBack)  $default,) {final _that = this;
switch (_that) {
case _SourceInfo():
return $default(_that.appIconUrl,_that.appName,_that.appDeepLinkCallBack);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String appIconUrl,  String appName,  String appDeepLinkCallBack)?  $default,) {final _that = this;
switch (_that) {
case _SourceInfo() when $default != null:
return $default(_that.appIconUrl,_that.appName,_that.appDeepLinkCallBack);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceInfo implements SourceInfo {
   _SourceInfo({required this.appIconUrl, required this.appName, required this.appDeepLinkCallBack});
  factory _SourceInfo.fromJson(Map<String, dynamic> json) => _$SourceInfoFromJson(json);

@override final  String appIconUrl;
@override final  String appName;
@override final  String appDeepLinkCallBack;

/// Create a copy of SourceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceInfoCopyWith<_SourceInfo> get copyWith => __$SourceInfoCopyWithImpl<_SourceInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceInfo&&(identical(other.appIconUrl, appIconUrl) || other.appIconUrl == appIconUrl)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.appDeepLinkCallBack, appDeepLinkCallBack) || other.appDeepLinkCallBack == appDeepLinkCallBack));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appIconUrl,appName,appDeepLinkCallBack);

@override
String toString() {
  return 'SourceInfo(appIconUrl: $appIconUrl, appName: $appName, appDeepLinkCallBack: $appDeepLinkCallBack)';
}


}

/// @nodoc
abstract mixin class _$SourceInfoCopyWith<$Res> implements $SourceInfoCopyWith<$Res> {
  factory _$SourceInfoCopyWith(_SourceInfo value, $Res Function(_SourceInfo) _then) = __$SourceInfoCopyWithImpl;
@override @useResult
$Res call({
 String appIconUrl, String appName, String appDeepLinkCallBack
});




}
/// @nodoc
class __$SourceInfoCopyWithImpl<$Res>
    implements _$SourceInfoCopyWith<$Res> {
  __$SourceInfoCopyWithImpl(this._self, this._then);

  final _SourceInfo _self;
  final $Res Function(_SourceInfo) _then;

/// Create a copy of SourceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appIconUrl = null,Object? appName = null,Object? appDeepLinkCallBack = null,}) {
  return _then(_SourceInfo(
appIconUrl: null == appIconUrl ? _self.appIconUrl : appIconUrl // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,appDeepLinkCallBack: null == appDeepLinkCallBack ? _self.appDeepLinkCallBack : appDeepLinkCallBack // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
