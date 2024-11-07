// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SourceInfo _$SourceInfoFromJson(Map<String, dynamic> json) {
  return _SourceInfo.fromJson(json);
}

/// @nodoc
mixin _$SourceInfo {
  String get appIconUrl => throw _privateConstructorUsedError;
  String get appName => throw _privateConstructorUsedError;
  String get appDeepLinkCallBack => throw _privateConstructorUsedError;

  /// Serializes this SourceInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SourceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourceInfoCopyWith<SourceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceInfoCopyWith<$Res> {
  factory $SourceInfoCopyWith(
          SourceInfo value, $Res Function(SourceInfo) then) =
      _$SourceInfoCopyWithImpl<$Res, SourceInfo>;
  @useResult
  $Res call({String appIconUrl, String appName, String appDeepLinkCallBack});
}

/// @nodoc
class _$SourceInfoCopyWithImpl<$Res, $Val extends SourceInfo>
    implements $SourceInfoCopyWith<$Res> {
  _$SourceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SourceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appIconUrl = null,
    Object? appName = null,
    Object? appDeepLinkCallBack = null,
  }) {
    return _then(_value.copyWith(
      appIconUrl: null == appIconUrl
          ? _value.appIconUrl
          : appIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      appDeepLinkCallBack: null == appDeepLinkCallBack
          ? _value.appDeepLinkCallBack
          : appDeepLinkCallBack // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceInfoImplCopyWith<$Res>
    implements $SourceInfoCopyWith<$Res> {
  factory _$$SourceInfoImplCopyWith(
          _$SourceInfoImpl value, $Res Function(_$SourceInfoImpl) then) =
      __$$SourceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appIconUrl, String appName, String appDeepLinkCallBack});
}

/// @nodoc
class __$$SourceInfoImplCopyWithImpl<$Res>
    extends _$SourceInfoCopyWithImpl<$Res, _$SourceInfoImpl>
    implements _$$SourceInfoImplCopyWith<$Res> {
  __$$SourceInfoImplCopyWithImpl(
      _$SourceInfoImpl _value, $Res Function(_$SourceInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appIconUrl = null,
    Object? appName = null,
    Object? appDeepLinkCallBack = null,
  }) {
    return _then(_$SourceInfoImpl(
      appIconUrl: null == appIconUrl
          ? _value.appIconUrl
          : appIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      appDeepLinkCallBack: null == appDeepLinkCallBack
          ? _value.appDeepLinkCallBack
          : appDeepLinkCallBack // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceInfoImpl implements _SourceInfo {
  _$SourceInfoImpl(
      {required this.appIconUrl,
      required this.appName,
      required this.appDeepLinkCallBack});

  factory _$SourceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceInfoImplFromJson(json);

  @override
  final String appIconUrl;
  @override
  final String appName;
  @override
  final String appDeepLinkCallBack;

  @override
  String toString() {
    return 'SourceInfo(appIconUrl: $appIconUrl, appName: $appName, appDeepLinkCallBack: $appDeepLinkCallBack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceInfoImpl &&
            (identical(other.appIconUrl, appIconUrl) ||
                other.appIconUrl == appIconUrl) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.appDeepLinkCallBack, appDeepLinkCallBack) ||
                other.appDeepLinkCallBack == appDeepLinkCallBack));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, appIconUrl, appName, appDeepLinkCallBack);

  /// Create a copy of SourceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceInfoImplCopyWith<_$SourceInfoImpl> get copyWith =>
      __$$SourceInfoImplCopyWithImpl<_$SourceInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceInfoImplToJson(
      this,
    );
  }
}

abstract class _SourceInfo implements SourceInfo {
  factory _SourceInfo(
      {required final String appIconUrl,
      required final String appName,
      required final String appDeepLinkCallBack}) = _$SourceInfoImpl;

  factory _SourceInfo.fromJson(Map<String, dynamic> json) =
      _$SourceInfoImpl.fromJson;

  @override
  String get appIconUrl;
  @override
  String get appName;
  @override
  String get appDeepLinkCallBack;

  /// Create a copy of SourceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourceInfoImplCopyWith<_$SourceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
