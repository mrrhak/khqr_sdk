// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
