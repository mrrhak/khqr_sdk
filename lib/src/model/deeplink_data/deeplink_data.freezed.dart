// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deeplink_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeeplinkData _$DeeplinkDataFromJson(Map<String, dynamic> json) {
  return _DeeplinkData.fromJson(json);
}

/// @nodoc
mixin _$DeeplinkData {
  String get shortLink => throw _privateConstructorUsedError;

  /// Serializes this DeeplinkData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeplinkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeplinkDataCopyWith<DeeplinkData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplinkDataCopyWith<$Res> {
  factory $DeeplinkDataCopyWith(
          DeeplinkData value, $Res Function(DeeplinkData) then) =
      _$DeeplinkDataCopyWithImpl<$Res, DeeplinkData>;
  @useResult
  $Res call({String shortLink});
}

/// @nodoc
class _$DeeplinkDataCopyWithImpl<$Res, $Val extends DeeplinkData>
    implements $DeeplinkDataCopyWith<$Res> {
  _$DeeplinkDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeplinkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortLink = null,
  }) {
    return _then(_value.copyWith(
      shortLink: null == shortLink
          ? _value.shortLink
          : shortLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeplinkDataImplCopyWith<$Res>
    implements $DeeplinkDataCopyWith<$Res> {
  factory _$$DeeplinkDataImplCopyWith(
          _$DeeplinkDataImpl value, $Res Function(_$DeeplinkDataImpl) then) =
      __$$DeeplinkDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String shortLink});
}

/// @nodoc
class __$$DeeplinkDataImplCopyWithImpl<$Res>
    extends _$DeeplinkDataCopyWithImpl<$Res, _$DeeplinkDataImpl>
    implements _$$DeeplinkDataImplCopyWith<$Res> {
  __$$DeeplinkDataImplCopyWithImpl(
      _$DeeplinkDataImpl _value, $Res Function(_$DeeplinkDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeplinkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortLink = null,
  }) {
    return _then(_$DeeplinkDataImpl(
      shortLink: null == shortLink
          ? _value.shortLink
          : shortLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeplinkDataImpl implements _DeeplinkData {
  _$DeeplinkDataImpl({required this.shortLink});

  factory _$DeeplinkDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeplinkDataImplFromJson(json);

  @override
  final String shortLink;

  @override
  String toString() {
    return 'DeeplinkData(shortLink: $shortLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplinkDataImpl &&
            (identical(other.shortLink, shortLink) ||
                other.shortLink == shortLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shortLink);

  /// Create a copy of DeeplinkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplinkDataImplCopyWith<_$DeeplinkDataImpl> get copyWith =>
      __$$DeeplinkDataImplCopyWithImpl<_$DeeplinkDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeplinkDataImplToJson(
      this,
    );
  }
}

abstract class _DeeplinkData implements DeeplinkData {
  factory _DeeplinkData({required final String shortLink}) = _$DeeplinkDataImpl;

  factory _DeeplinkData.fromJson(Map<String, dynamic> json) =
      _$DeeplinkDataImpl.fromJson;

  @override
  String get shortLink;

  /// Create a copy of DeeplinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeplinkDataImplCopyWith<_$DeeplinkDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
