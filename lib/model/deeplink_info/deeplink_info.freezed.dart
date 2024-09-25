// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deeplink_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeeplinkInfo _$DeeplinkInfoFromJson(Map<String, dynamic> json) {
  return _DeeplinkInfo.fromJson(json);
}

/// @nodoc
mixin _$DeeplinkInfo {
  String get qr => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  SourceInfo? get sourceInfo => throw _privateConstructorUsedError;

  /// Serializes this DeeplinkInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeplinkInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeplinkInfoCopyWith<DeeplinkInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplinkInfoCopyWith<$Res> {
  factory $DeeplinkInfoCopyWith(
          DeeplinkInfo value, $Res Function(DeeplinkInfo) then) =
      _$DeeplinkInfoCopyWithImpl<$Res, DeeplinkInfo>;
  @useResult
  $Res call({String qr, String url, SourceInfo? sourceInfo});

  $SourceInfoCopyWith<$Res>? get sourceInfo;
}

/// @nodoc
class _$DeeplinkInfoCopyWithImpl<$Res, $Val extends DeeplinkInfo>
    implements $DeeplinkInfoCopyWith<$Res> {
  _$DeeplinkInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeplinkInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qr = null,
    Object? url = null,
    Object? sourceInfo = freezed,
  }) {
    return _then(_value.copyWith(
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      sourceInfo: freezed == sourceInfo
          ? _value.sourceInfo
          : sourceInfo // ignore: cast_nullable_to_non_nullable
              as SourceInfo?,
    ) as $Val);
  }

  /// Create a copy of DeeplinkInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SourceInfoCopyWith<$Res>? get sourceInfo {
    if (_value.sourceInfo == null) {
      return null;
    }

    return $SourceInfoCopyWith<$Res>(_value.sourceInfo!, (value) {
      return _then(_value.copyWith(sourceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeeplinkInfoImplCopyWith<$Res>
    implements $DeeplinkInfoCopyWith<$Res> {
  factory _$$DeeplinkInfoImplCopyWith(
          _$DeeplinkInfoImpl value, $Res Function(_$DeeplinkInfoImpl) then) =
      __$$DeeplinkInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qr, String url, SourceInfo? sourceInfo});

  @override
  $SourceInfoCopyWith<$Res>? get sourceInfo;
}

/// @nodoc
class __$$DeeplinkInfoImplCopyWithImpl<$Res>
    extends _$DeeplinkInfoCopyWithImpl<$Res, _$DeeplinkInfoImpl>
    implements _$$DeeplinkInfoImplCopyWith<$Res> {
  __$$DeeplinkInfoImplCopyWithImpl(
      _$DeeplinkInfoImpl _value, $Res Function(_$DeeplinkInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeplinkInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qr = null,
    Object? url = null,
    Object? sourceInfo = freezed,
  }) {
    return _then(_$DeeplinkInfoImpl(
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      sourceInfo: freezed == sourceInfo
          ? _value.sourceInfo
          : sourceInfo // ignore: cast_nullable_to_non_nullable
              as SourceInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeplinkInfoImpl implements _DeeplinkInfo {
  _$DeeplinkInfoImpl({required this.qr, required this.url, this.sourceInfo});

  factory _$DeeplinkInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeplinkInfoImplFromJson(json);

  @override
  final String qr;
  @override
  final String url;
  @override
  final SourceInfo? sourceInfo;

  @override
  String toString() {
    return 'DeeplinkInfo(qr: $qr, url: $url, sourceInfo: $sourceInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplinkInfoImpl &&
            (identical(other.qr, qr) || other.qr == qr) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.sourceInfo, sourceInfo) ||
                other.sourceInfo == sourceInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, qr, url, sourceInfo);

  /// Create a copy of DeeplinkInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplinkInfoImplCopyWith<_$DeeplinkInfoImpl> get copyWith =>
      __$$DeeplinkInfoImplCopyWithImpl<_$DeeplinkInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeplinkInfoImplToJson(
      this,
    );
  }
}

abstract class _DeeplinkInfo implements DeeplinkInfo {
  factory _DeeplinkInfo(
      {required final String qr,
      required final String url,
      final SourceInfo? sourceInfo}) = _$DeeplinkInfoImpl;

  factory _DeeplinkInfo.fromJson(Map<String, dynamic> json) =
      _$DeeplinkInfoImpl.fromJson;

  @override
  String get qr;
  @override
  String get url;
  @override
  SourceInfo? get sourceInfo;

  /// Create a copy of DeeplinkInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeplinkInfoImplCopyWith<_$DeeplinkInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
