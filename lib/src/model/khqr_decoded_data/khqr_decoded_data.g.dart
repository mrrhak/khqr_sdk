// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'khqr_decoded_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KhqrDecodedDataImpl _$$KhqrDecodedDataImplFromJson(
        Map<String, dynamic> json) =>
    _$KhqrDecodedDataImpl(
      payloadFormatIndicator: json['payloadFormatIndicator'] as String?,
      pointOfInitiationMethod: json['pointOfInitiationMethod'] as String?,
      bakongAccountId: json['bakongAccountID'] as String,
      merchantId: json['merchantId'] as String?,
      accountInformation: json['accountInformation'] as String?,
      acquiringBank: json['acquiringBank'] as String?,
      merchantType: json['merchantType'] as String?,
      transactionCurrency: json['transactionCurrency'] as String?,
      merchantName: json['merchantName'] as String,
      transactionAmount: json['transactionAmount'] as String?,
      merchantCategoryCode: json['merchantCategoryCode'] as String?,
      countryCode: json['countryCode'] as String?,
      merchantCity: json['merchantCity'] as String?,
      billNumber: json['billNumber'] as String?,
      storeLabel: json['storeLabel'] as String?,
      terminalLabel: json['terminalLabel'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      timestamp: json['timestamp'] as String?,
      crc: json['crc'] as String?,
      upiAccountInformation: json['upiAccountInformation'] as String?,
      purposeOfTransaction: json['purposeOfTransaction'] as String?,
      merchantAlternateLanguagePreference:
          json['merchantAlternateLanguagePreference'] as String?,
      merchantNameAlternateLanguage:
          json['merchantNameAlternateLanguage'] as String?,
      merchantCityAlternateLanguage:
          json['merchantCityAlternateLanguage'] as String?,
    );

Map<String, dynamic> _$$KhqrDecodedDataImplToJson(
        _$KhqrDecodedDataImpl instance) =>
    <String, dynamic>{
      'payloadFormatIndicator': instance.payloadFormatIndicator,
      'pointOfInitiationMethod': instance.pointOfInitiationMethod,
      'bakongAccountID': instance.bakongAccountId,
      'merchantId': instance.merchantId,
      'accountInformation': instance.accountInformation,
      'acquiringBank': instance.acquiringBank,
      'merchantType': instance.merchantType,
      'transactionCurrency': instance.transactionCurrency,
      'merchantName': instance.merchantName,
      'transactionAmount': instance.transactionAmount,
      'merchantCategoryCode': instance.merchantCategoryCode,
      'countryCode': instance.countryCode,
      'merchantCity': instance.merchantCity,
      'billNumber': instance.billNumber,
      'storeLabel': instance.storeLabel,
      'terminalLabel': instance.terminalLabel,
      'mobileNumber': instance.mobileNumber,
      'timestamp': instance.timestamp,
      'crc': instance.crc,
      'upiAccountInformation': instance.upiAccountInformation,
      'purposeOfTransaction': instance.purposeOfTransaction,
      'merchantAlternateLanguagePreference':
          instance.merchantAlternateLanguagePreference,
      'merchantNameAlternateLanguage': instance.merchantNameAlternateLanguage,
      'merchantCityAlternateLanguage': instance.merchantCityAlternateLanguage,
    };