// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IndividualInfo _$IndividualInfoFromJson(Map<String, dynamic> json) =>
    _IndividualInfo(
      bakongAccountId: json['bakongAccountId'] as String,
      accountInformation: json['accountInformation'] as String?,
      acquiringBank: json['acquiringBank'] as String?,
      currency:
          $enumDecodeNullable(_$KhqrCurrencyEnumMap, json['currency']) ??
          KhqrCurrency.khr,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      merchantName: json['merchantName'] as String,
      merchantCity: json['merchantCity'] as String? ?? 'Phnom Penh',
      billNumber: json['billNumber'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      storeLabel: json['storeLabel'] as String?,
      terminalLabel: json['terminalLabel'] as String?,
      purposeOfTransaction: json['purposeOfTransaction'] as String?,
      upiAccountInformation: json['upiAccountInformation'] as String?,
      merchantAlternateLanguagePreference:
          json['merchantAlternateLanguagePreference'] as String?,
      merchantNameAlternateLanguage:
          json['merchantNameAlternateLanguage'] as String?,
      merchantCityAlternateLanguage:
          json['merchantCityAlternateLanguage'] as String?,
      expirationTimestamp: (json['expirationTimestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IndividualInfoToJson(_IndividualInfo instance) =>
    <String, dynamic>{
      'bakongAccountId': instance.bakongAccountId,
      'accountInformation': instance.accountInformation,
      'acquiringBank': instance.acquiringBank,
      'currency': _$KhqrCurrencyEnumMap[instance.currency]!,
      'amount': instance.amount,
      'merchantName': instance.merchantName,
      'merchantCity': instance.merchantCity,
      'billNumber': instance.billNumber,
      'mobileNumber': instance.mobileNumber,
      'storeLabel': instance.storeLabel,
      'terminalLabel': instance.terminalLabel,
      'purposeOfTransaction': instance.purposeOfTransaction,
      'upiAccountInformation': instance.upiAccountInformation,
      'merchantAlternateLanguagePreference':
          instance.merchantAlternateLanguagePreference,
      'merchantNameAlternateLanguage': instance.merchantNameAlternateLanguage,
      'merchantCityAlternateLanguage': instance.merchantCityAlternateLanguage,
      'expirationTimestamp': instance.expirationTimestamp,
    };

const _$KhqrCurrencyEnumMap = {
  KhqrCurrency.khr: 'khr',
  KhqrCurrency.usd: 'usd',
};
