import 'emv.dart';

/// Input Tag Class
class InputTag {
  /// Tag
  final String tag;

  /// Data
  final Map<String, dynamic> data;

  /// Input Tag Constructor
  const InputTag({required this.tag, required this.data});
}

/// Compare Tag Class
class CompareTag {
  /// Tag
  final String tag;

  /// Sub Tag
  final String subTag;

  /// Name
  final String name;

  /// Compare Tag Constructor
  const CompareTag({
    required this.tag,
    required this.subTag,
    required this.name,
  });
}

/// Khqr Sub Tag Class
class KhqrSubTag {
  /// Input
  static const input = [
    InputTag(
      tag: '29',
      data: {'bakongAccountID': null, 'accountInformation': null},
    ),
    InputTag(
      tag: '30',
      data: {
        'bakongAccountID': null,
        'merchantID': null,
        'acquiringBank': null,
      },
    ),
    InputTag(
      tag: '62',
      data: {
        'billNumber': null,
        'mobileNumber': null,
        'storeLabel': null,
        'terminalLabel': null,
        'purposeOfTransaction': null,
      },
    ),
    InputTag(
      tag: '64',
      data: {
        'languagePreference': null,
        'merchantNameAlternateLanguage': null,
        'merchantCityAlternateLanguage': null,
      },
    ),
    InputTag(
      tag: '99',
      data: {'creationTimestamp': null, 'expirationTimestamp': null},
    ),
  ];

  /// Compare
  static const compare = [
    CompareTag(
      tag: '29',
      subTag: EMV.bakongAccountIdentifier,
      name: 'bakongAccountID',
    ),
    CompareTag(
      tag: '29',
      subTag: EMV.merchantAccountInformationMerchantId,
      name: 'accountInformation',
    ),
    CompareTag(
      tag: '29',
      subTag: EMV.merchantAccountInformationAcquiringBank,
      name: 'acquiringBank',
    ),
    CompareTag(tag: '62', subTag: EMV.billNumberTag, name: 'billNumber'),
    CompareTag(
      tag: '62',
      subTag: EMV.additionalDataFieldMobileNumber,
      name: 'mobileNumber',
    ),
    CompareTag(tag: '62', subTag: EMV.storeLabelTag, name: 'storeLabel'),
    CompareTag(
      tag: '62',
      subTag: EMV.purposeOfTransaction,
      name: 'purposeOfTransaction',
    ),
    CompareTag(tag: '62', subTag: EMV.terminalTag, name: 'terminalLabel'),
    CompareTag(
      tag: '64',
      subTag: EMV.languagePreference,
      name: 'languagePreference',
    ),
    CompareTag(
      tag: '64',
      subTag: EMV.merchantNameAlternateLanguage,
      name: 'merchantNameAlternateLanguage',
    ),
    CompareTag(
      tag: '64',
      subTag: EMV.merchantCityAlternateLanguage,
      name: 'merchantCityAlternateLanguage',
    ),
    CompareTag(
      tag: '99',
      subTag: EMV.creationTimestamp,
      name: 'creationTimestamp',
    ),
    CompareTag(
      tag: '99',
      subTag: EMV.expirationTimestamp,
      name: 'expirationTimestamp',
    ),
  ];
}
