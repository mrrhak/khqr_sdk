// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deeplink_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeeplinkInfo {

 String get qr; String get url; SourceInfo? get sourceInfo;
/// Create a copy of DeeplinkInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeeplinkInfoCopyWith<DeeplinkInfo> get copyWith => _$DeeplinkInfoCopyWithImpl<DeeplinkInfo>(this as DeeplinkInfo, _$identity);

  /// Serializes this DeeplinkInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeeplinkInfo&&(identical(other.qr, qr) || other.qr == qr)&&(identical(other.url, url) || other.url == url)&&(identical(other.sourceInfo, sourceInfo) || other.sourceInfo == sourceInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qr,url,sourceInfo);

@override
String toString() {
  return 'DeeplinkInfo(qr: $qr, url: $url, sourceInfo: $sourceInfo)';
}


}

/// @nodoc
abstract mixin class $DeeplinkInfoCopyWith<$Res>  {
  factory $DeeplinkInfoCopyWith(DeeplinkInfo value, $Res Function(DeeplinkInfo) _then) = _$DeeplinkInfoCopyWithImpl;
@useResult
$Res call({
 String qr, String url, SourceInfo? sourceInfo
});


$SourceInfoCopyWith<$Res>? get sourceInfo;

}
/// @nodoc
class _$DeeplinkInfoCopyWithImpl<$Res>
    implements $DeeplinkInfoCopyWith<$Res> {
  _$DeeplinkInfoCopyWithImpl(this._self, this._then);

  final DeeplinkInfo _self;
  final $Res Function(DeeplinkInfo) _then;

/// Create a copy of DeeplinkInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? qr = null,Object? url = null,Object? sourceInfo = freezed,}) {
  return _then(_self.copyWith(
qr: null == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,sourceInfo: freezed == sourceInfo ? _self.sourceInfo : sourceInfo // ignore: cast_nullable_to_non_nullable
as SourceInfo?,
  ));
}
/// Create a copy of DeeplinkInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceInfoCopyWith<$Res>? get sourceInfo {
    if (_self.sourceInfo == null) {
    return null;
  }

  return $SourceInfoCopyWith<$Res>(_self.sourceInfo!, (value) {
    return _then(_self.copyWith(sourceInfo: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _DeeplinkInfo implements DeeplinkInfo {
   _DeeplinkInfo({required this.qr, required this.url, this.sourceInfo});
  factory _DeeplinkInfo.fromJson(Map<String, dynamic> json) => _$DeeplinkInfoFromJson(json);

@override final  String qr;
@override final  String url;
@override final  SourceInfo? sourceInfo;

/// Create a copy of DeeplinkInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeeplinkInfoCopyWith<_DeeplinkInfo> get copyWith => __$DeeplinkInfoCopyWithImpl<_DeeplinkInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeeplinkInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeeplinkInfo&&(identical(other.qr, qr) || other.qr == qr)&&(identical(other.url, url) || other.url == url)&&(identical(other.sourceInfo, sourceInfo) || other.sourceInfo == sourceInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qr,url,sourceInfo);

@override
String toString() {
  return 'DeeplinkInfo(qr: $qr, url: $url, sourceInfo: $sourceInfo)';
}


}

/// @nodoc
abstract mixin class _$DeeplinkInfoCopyWith<$Res> implements $DeeplinkInfoCopyWith<$Res> {
  factory _$DeeplinkInfoCopyWith(_DeeplinkInfo value, $Res Function(_DeeplinkInfo) _then) = __$DeeplinkInfoCopyWithImpl;
@override @useResult
$Res call({
 String qr, String url, SourceInfo? sourceInfo
});


@override $SourceInfoCopyWith<$Res>? get sourceInfo;

}
/// @nodoc
class __$DeeplinkInfoCopyWithImpl<$Res>
    implements _$DeeplinkInfoCopyWith<$Res> {
  __$DeeplinkInfoCopyWithImpl(this._self, this._then);

  final _DeeplinkInfo _self;
  final $Res Function(_DeeplinkInfo) _then;

/// Create a copy of DeeplinkInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? qr = null,Object? url = null,Object? sourceInfo = freezed,}) {
  return _then(_DeeplinkInfo(
qr: null == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,sourceInfo: freezed == sourceInfo ? _self.sourceInfo : sourceInfo // ignore: cast_nullable_to_non_nullable
as SourceInfo?,
  ));
}

/// Create a copy of DeeplinkInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceInfoCopyWith<$Res>? get sourceInfo {
    if (_self.sourceInfo == null) {
    return null;
  }

  return $SourceInfoCopyWith<$Res>(_self.sourceInfo!, (value) {
    return _then(_self.copyWith(sourceInfo: value));
  });
}
}

// dart format on
