// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'khqr_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KhqrData _$KhqrDataFromJson(Map<String, dynamic> json) {
  return _KhqrData.fromJson(json);
}

/// @nodoc
mixin _$KhqrData {
  String get qr => throw _privateConstructorUsedError;
  String get md5 => throw _privateConstructorUsedError;

  /// Serializes this KhqrData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KhqrData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KhqrDataCopyWith<KhqrData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KhqrDataCopyWith<$Res> {
  factory $KhqrDataCopyWith(KhqrData value, $Res Function(KhqrData) then) =
      _$KhqrDataCopyWithImpl<$Res, KhqrData>;
  @useResult
  $Res call({String qr, String md5});
}

/// @nodoc
class _$KhqrDataCopyWithImpl<$Res, $Val extends KhqrData>
    implements $KhqrDataCopyWith<$Res> {
  _$KhqrDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KhqrData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qr = null,
    Object? md5 = null,
  }) {
    return _then(_value.copyWith(
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      md5: null == md5
          ? _value.md5
          : md5 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KhqrDataImplCopyWith<$Res>
    implements $KhqrDataCopyWith<$Res> {
  factory _$$KhqrDataImplCopyWith(
          _$KhqrDataImpl value, $Res Function(_$KhqrDataImpl) then) =
      __$$KhqrDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qr, String md5});
}

/// @nodoc
class __$$KhqrDataImplCopyWithImpl<$Res>
    extends _$KhqrDataCopyWithImpl<$Res, _$KhqrDataImpl>
    implements _$$KhqrDataImplCopyWith<$Res> {
  __$$KhqrDataImplCopyWithImpl(
      _$KhqrDataImpl _value, $Res Function(_$KhqrDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of KhqrData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qr = null,
    Object? md5 = null,
  }) {
    return _then(_$KhqrDataImpl(
      qr: null == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String,
      md5: null == md5
          ? _value.md5
          : md5 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KhqrDataImpl implements _KhqrData {
  _$KhqrDataImpl({required this.qr, required this.md5});

  factory _$KhqrDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$KhqrDataImplFromJson(json);

  @override
  final String qr;
  @override
  final String md5;

  @override
  String toString() {
    return 'KhqrData(qr: $qr, md5: $md5)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KhqrDataImpl &&
            (identical(other.qr, qr) || other.qr == qr) &&
            (identical(other.md5, md5) || other.md5 == md5));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, qr, md5);

  /// Create a copy of KhqrData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KhqrDataImplCopyWith<_$KhqrDataImpl> get copyWith =>
      __$$KhqrDataImplCopyWithImpl<_$KhqrDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KhqrDataImplToJson(
      this,
    );
  }
}

abstract class _KhqrData implements KhqrData {
  factory _KhqrData({required final String qr, required final String md5}) =
      _$KhqrDataImpl;

  factory _KhqrData.fromJson(Map<String, dynamic> json) =
      _$KhqrDataImpl.fromJson;

  @override
  String get qr;
  @override
  String get md5;

  /// Create a copy of KhqrData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KhqrDataImplCopyWith<_$KhqrDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
