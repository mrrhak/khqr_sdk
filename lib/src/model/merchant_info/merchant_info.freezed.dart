// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MerchantInfo {
  String get bakongAccountId;
  String get merchantId;
  String get acquiringBank;
  KhqrCurrency get currency;
  double get amount;
  String get merchantName;
  String get merchantCity;
  String? get billNumber;
  String? get mobileNumber;
  String? get storeLabel;
  String? get terminalLabel;
  String? get purposeOfTransaction;
  String? get upiAccountInformation;
  String? get merchantAlternateLanguagePreference;
  String? get merchantNameAlternateLanguage;
  String? get merchantCityAlternateLanguage;
  int? get expirationTimestamp;

  /// Create a copy of MerchantInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MerchantInfoCopyWith<MerchantInfo> get copyWith =>
      _$MerchantInfoCopyWithImpl<MerchantInfo>(
          this as MerchantInfo, _$identity);

  /// Serializes this MerchantInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MerchantInfo &&
            (identical(other.bakongAccountId, bakongAccountId) ||
                other.bakongAccountId == bakongAccountId) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.acquiringBank, acquiringBank) ||
                other.acquiringBank == acquiringBank) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.merchantCity, merchantCity) ||
                other.merchantCity == merchantCity) &&
            (identical(other.billNumber, billNumber) ||
                other.billNumber == billNumber) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.storeLabel, storeLabel) ||
                other.storeLabel == storeLabel) &&
            (identical(other.terminalLabel, terminalLabel) ||
                other.terminalLabel == terminalLabel) &&
            (identical(other.purposeOfTransaction, purposeOfTransaction) ||
                other.purposeOfTransaction == purposeOfTransaction) &&
            (identical(other.upiAccountInformation, upiAccountInformation) ||
                other.upiAccountInformation == upiAccountInformation) &&
            (identical(other.merchantAlternateLanguagePreference,
                    merchantAlternateLanguagePreference) ||
                other.merchantAlternateLanguagePreference ==
                    merchantAlternateLanguagePreference) &&
            (identical(other.merchantNameAlternateLanguage,
                    merchantNameAlternateLanguage) ||
                other.merchantNameAlternateLanguage ==
                    merchantNameAlternateLanguage) &&
            (identical(other.merchantCityAlternateLanguage,
                    merchantCityAlternateLanguage) ||
                other.merchantCityAlternateLanguage ==
                    merchantCityAlternateLanguage) &&
            (identical(other.expirationTimestamp, expirationTimestamp) ||
                other.expirationTimestamp == expirationTimestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bakongAccountId,
      merchantId,
      acquiringBank,
      currency,
      amount,
      merchantName,
      merchantCity,
      billNumber,
      mobileNumber,
      storeLabel,
      terminalLabel,
      purposeOfTransaction,
      upiAccountInformation,
      merchantAlternateLanguagePreference,
      merchantNameAlternateLanguage,
      merchantCityAlternateLanguage,
      expirationTimestamp);

  @override
  String toString() {
    return 'MerchantInfo(bakongAccountId: $bakongAccountId, merchantId: $merchantId, acquiringBank: $acquiringBank, currency: $currency, amount: $amount, merchantName: $merchantName, merchantCity: $merchantCity, billNumber: $billNumber, mobileNumber: $mobileNumber, storeLabel: $storeLabel, terminalLabel: $terminalLabel, purposeOfTransaction: $purposeOfTransaction, upiAccountInformation: $upiAccountInformation, merchantAlternateLanguagePreference: $merchantAlternateLanguagePreference, merchantNameAlternateLanguage: $merchantNameAlternateLanguage, merchantCityAlternateLanguage: $merchantCityAlternateLanguage, expirationTimestamp: $expirationTimestamp)';
  }
}

/// @nodoc
abstract mixin class $MerchantInfoCopyWith<$Res> {
  factory $MerchantInfoCopyWith(
          MerchantInfo value, $Res Function(MerchantInfo) _then) =
      _$MerchantInfoCopyWithImpl;
  @useResult
  $Res call(
      {String bakongAccountId,
      String merchantId,
      String acquiringBank,
      KhqrCurrency currency,
      double amount,
      String merchantName,
      String merchantCity,
      String? billNumber,
      String? mobileNumber,
      String? storeLabel,
      String? terminalLabel,
      String? purposeOfTransaction,
      String? upiAccountInformation,
      String? merchantAlternateLanguagePreference,
      String? merchantNameAlternateLanguage,
      String? merchantCityAlternateLanguage,
      int? expirationTimestamp});
}

/// @nodoc
class _$MerchantInfoCopyWithImpl<$Res> implements $MerchantInfoCopyWith<$Res> {
  _$MerchantInfoCopyWithImpl(this._self, this._then);

  final MerchantInfo _self;
  final $Res Function(MerchantInfo) _then;

  /// Create a copy of MerchantInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bakongAccountId = null,
    Object? merchantId = null,
    Object? acquiringBank = null,
    Object? currency = null,
    Object? amount = null,
    Object? merchantName = null,
    Object? merchantCity = null,
    Object? billNumber = freezed,
    Object? mobileNumber = freezed,
    Object? storeLabel = freezed,
    Object? terminalLabel = freezed,
    Object? purposeOfTransaction = freezed,
    Object? upiAccountInformation = freezed,
    Object? merchantAlternateLanguagePreference = freezed,
    Object? merchantNameAlternateLanguage = freezed,
    Object? merchantCityAlternateLanguage = freezed,
    Object? expirationTimestamp = freezed,
  }) {
    return _then(_self.copyWith(
      bakongAccountId: null == bakongAccountId
          ? _self.bakongAccountId
          : bakongAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      merchantId: null == merchantId
          ? _self.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String,
      acquiringBank: null == acquiringBank
          ? _self.acquiringBank
          : acquiringBank // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as KhqrCurrency,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      merchantName: null == merchantName
          ? _self.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String,
      merchantCity: null == merchantCity
          ? _self.merchantCity
          : merchantCity // ignore: cast_nullable_to_non_nullable
              as String,
      billNumber: freezed == billNumber
          ? _self.billNumber
          : billNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      storeLabel: freezed == storeLabel
          ? _self.storeLabel
          : storeLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalLabel: freezed == terminalLabel
          ? _self.terminalLabel
          : terminalLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      purposeOfTransaction: freezed == purposeOfTransaction
          ? _self.purposeOfTransaction
          : purposeOfTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
      upiAccountInformation: freezed == upiAccountInformation
          ? _self.upiAccountInformation
          : upiAccountInformation // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantAlternateLanguagePreference: freezed ==
              merchantAlternateLanguagePreference
          ? _self.merchantAlternateLanguagePreference
          : merchantAlternateLanguagePreference // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantNameAlternateLanguage: freezed == merchantNameAlternateLanguage
          ? _self.merchantNameAlternateLanguage
          : merchantNameAlternateLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantCityAlternateLanguage: freezed == merchantCityAlternateLanguage
          ? _self.merchantCityAlternateLanguage
          : merchantCityAlternateLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationTimestamp: freezed == expirationTimestamp
          ? _self.expirationTimestamp
          : expirationTimestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MerchantInfo implements MerchantInfo {
  _MerchantInfo(
      {required this.bakongAccountId,
      required this.merchantId,
      required this.acquiringBank,
      this.currency = KhqrCurrency.khr,
      this.amount = 0,
      required this.merchantName,
      this.merchantCity = 'Phnom Penh',
      this.billNumber,
      this.mobileNumber,
      this.storeLabel,
      this.terminalLabel,
      this.purposeOfTransaction,
      this.upiAccountInformation,
      this.merchantAlternateLanguagePreference,
      this.merchantNameAlternateLanguage,
      this.merchantCityAlternateLanguage,
      this.expirationTimestamp});
  factory _MerchantInfo.fromJson(Map<String, dynamic> json) =>
      _$MerchantInfoFromJson(json);

  @override
  final String bakongAccountId;
  @override
  final String merchantId;
  @override
  final String acquiringBank;
  @override
  @JsonKey()
  final KhqrCurrency currency;
  @override
  @JsonKey()
  final double amount;
  @override
  final String merchantName;
  @override
  @JsonKey()
  final String merchantCity;
  @override
  final String? billNumber;
  @override
  final String? mobileNumber;
  @override
  final String? storeLabel;
  @override
  final String? terminalLabel;
  @override
  final String? purposeOfTransaction;
  @override
  final String? upiAccountInformation;
  @override
  final String? merchantAlternateLanguagePreference;
  @override
  final String? merchantNameAlternateLanguage;
  @override
  final String? merchantCityAlternateLanguage;
  @override
  final int? expirationTimestamp;

  /// Create a copy of MerchantInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MerchantInfoCopyWith<_MerchantInfo> get copyWith =>
      __$MerchantInfoCopyWithImpl<_MerchantInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MerchantInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MerchantInfo &&
            (identical(other.bakongAccountId, bakongAccountId) ||
                other.bakongAccountId == bakongAccountId) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.acquiringBank, acquiringBank) ||
                other.acquiringBank == acquiringBank) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.merchantCity, merchantCity) ||
                other.merchantCity == merchantCity) &&
            (identical(other.billNumber, billNumber) ||
                other.billNumber == billNumber) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.storeLabel, storeLabel) ||
                other.storeLabel == storeLabel) &&
            (identical(other.terminalLabel, terminalLabel) ||
                other.terminalLabel == terminalLabel) &&
            (identical(other.purposeOfTransaction, purposeOfTransaction) ||
                other.purposeOfTransaction == purposeOfTransaction) &&
            (identical(other.upiAccountInformation, upiAccountInformation) ||
                other.upiAccountInformation == upiAccountInformation) &&
            (identical(other.merchantAlternateLanguagePreference,
                    merchantAlternateLanguagePreference) ||
                other.merchantAlternateLanguagePreference ==
                    merchantAlternateLanguagePreference) &&
            (identical(other.merchantNameAlternateLanguage,
                    merchantNameAlternateLanguage) ||
                other.merchantNameAlternateLanguage ==
                    merchantNameAlternateLanguage) &&
            (identical(other.merchantCityAlternateLanguage,
                    merchantCityAlternateLanguage) ||
                other.merchantCityAlternateLanguage ==
                    merchantCityAlternateLanguage) &&
            (identical(other.expirationTimestamp, expirationTimestamp) ||
                other.expirationTimestamp == expirationTimestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bakongAccountId,
      merchantId,
      acquiringBank,
      currency,
      amount,
      merchantName,
      merchantCity,
      billNumber,
      mobileNumber,
      storeLabel,
      terminalLabel,
      purposeOfTransaction,
      upiAccountInformation,
      merchantAlternateLanguagePreference,
      merchantNameAlternateLanguage,
      merchantCityAlternateLanguage,
      expirationTimestamp);

  @override
  String toString() {
    return 'MerchantInfo(bakongAccountId: $bakongAccountId, merchantId: $merchantId, acquiringBank: $acquiringBank, currency: $currency, amount: $amount, merchantName: $merchantName, merchantCity: $merchantCity, billNumber: $billNumber, mobileNumber: $mobileNumber, storeLabel: $storeLabel, terminalLabel: $terminalLabel, purposeOfTransaction: $purposeOfTransaction, upiAccountInformation: $upiAccountInformation, merchantAlternateLanguagePreference: $merchantAlternateLanguagePreference, merchantNameAlternateLanguage: $merchantNameAlternateLanguage, merchantCityAlternateLanguage: $merchantCityAlternateLanguage, expirationTimestamp: $expirationTimestamp)';
  }
}

/// @nodoc
abstract mixin class _$MerchantInfoCopyWith<$Res>
    implements $MerchantInfoCopyWith<$Res> {
  factory _$MerchantInfoCopyWith(
          _MerchantInfo value, $Res Function(_MerchantInfo) _then) =
      __$MerchantInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String bakongAccountId,
      String merchantId,
      String acquiringBank,
      KhqrCurrency currency,
      double amount,
      String merchantName,
      String merchantCity,
      String? billNumber,
      String? mobileNumber,
      String? storeLabel,
      String? terminalLabel,
      String? purposeOfTransaction,
      String? upiAccountInformation,
      String? merchantAlternateLanguagePreference,
      String? merchantNameAlternateLanguage,
      String? merchantCityAlternateLanguage,
      int? expirationTimestamp});
}

/// @nodoc
class __$MerchantInfoCopyWithImpl<$Res>
    implements _$MerchantInfoCopyWith<$Res> {
  __$MerchantInfoCopyWithImpl(this._self, this._then);

  final _MerchantInfo _self;
  final $Res Function(_MerchantInfo) _then;

  /// Create a copy of MerchantInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bakongAccountId = null,
    Object? merchantId = null,
    Object? acquiringBank = null,
    Object? currency = null,
    Object? amount = null,
    Object? merchantName = null,
    Object? merchantCity = null,
    Object? billNumber = freezed,
    Object? mobileNumber = freezed,
    Object? storeLabel = freezed,
    Object? terminalLabel = freezed,
    Object? purposeOfTransaction = freezed,
    Object? upiAccountInformation = freezed,
    Object? merchantAlternateLanguagePreference = freezed,
    Object? merchantNameAlternateLanguage = freezed,
    Object? merchantCityAlternateLanguage = freezed,
    Object? expirationTimestamp = freezed,
  }) {
    return _then(_MerchantInfo(
      bakongAccountId: null == bakongAccountId
          ? _self.bakongAccountId
          : bakongAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      merchantId: null == merchantId
          ? _self.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String,
      acquiringBank: null == acquiringBank
          ? _self.acquiringBank
          : acquiringBank // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as KhqrCurrency,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      merchantName: null == merchantName
          ? _self.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String,
      merchantCity: null == merchantCity
          ? _self.merchantCity
          : merchantCity // ignore: cast_nullable_to_non_nullable
              as String,
      billNumber: freezed == billNumber
          ? _self.billNumber
          : billNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      storeLabel: freezed == storeLabel
          ? _self.storeLabel
          : storeLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalLabel: freezed == terminalLabel
          ? _self.terminalLabel
          : terminalLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      purposeOfTransaction: freezed == purposeOfTransaction
          ? _self.purposeOfTransaction
          : purposeOfTransaction // ignore: cast_nullable_to_non_nullable
              as String?,
      upiAccountInformation: freezed == upiAccountInformation
          ? _self.upiAccountInformation
          : upiAccountInformation // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantAlternateLanguagePreference: freezed ==
              merchantAlternateLanguagePreference
          ? _self.merchantAlternateLanguagePreference
          : merchantAlternateLanguagePreference // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantNameAlternateLanguage: freezed == merchantNameAlternateLanguage
          ? _self.merchantNameAlternateLanguage
          : merchantNameAlternateLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantCityAlternateLanguage: freezed == merchantCityAlternateLanguage
          ? _self.merchantCityAlternateLanguage
          : merchantCityAlternateLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationTimestamp: freezed == expirationTimestamp
          ? _self.expirationTimestamp
          : expirationTimestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
