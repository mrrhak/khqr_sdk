import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Bakong Account Id Class
class BakongAccountId extends TagLengthString {
  /// Bakong Account Id Constructor
  BakongAccountId(String tag, String bakongAccountId)
    : super(tag, bakongAccountId) {
    if (bakongAccountId.isEmpty) {
      throw KhqrResponse.error(ErrorCode.bakongAccountIdRequired);
    }

    if (bakongAccountId.length > EMV.invalidLength['bakongAccount']!) {
      throw KhqrResponse.error(ErrorCode.bakongAccountIdLengthInvalid);
    }

    final bakongAccountDivide = bakongAccountId.split('@');
    if (bakongAccountDivide.length < 2) {
      throw KhqrResponse.error(ErrorCode.bakongAccountIdInvalid);
    }
  }
}

/// Account Information Class
class AccountInformation extends TagLengthString {
  /// Account Information Constructor
  AccountInformation(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['accountInformation']!) {
      throw KhqrResponse.error(ErrorCode.accountInformationLengthInvalid);
    }
  }
}

/// Merchant Id Class
class MerchantId extends TagLengthString {
  /// Merchant Id Constructor
  MerchantId(String tag, String value) : super(tag, value) {
    if (value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.merchantIdRequired);
    }
    if (value.length > EMV.invalidLength['merchantId']!) {
      throw KhqrResponse.error(ErrorCode.merchantIdLengthInvalid);
    }
  }
}

/// Acquiring Bank Class
class AcquiringBank extends TagLengthString {
  /// Acquiring Bank Constructor
  AcquiringBank(String tag, String value) : super(tag, value) {
    if (value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.acquiringBankRequired);
    }
    if (value.length > EMV.invalidLength['acquiringBank']!) {
      throw KhqrResponse.error(ErrorCode.acquiringBankLengthInvalid);
    }
  }
}

/// Global Unique Identifier Class
class GlobalUniqueIdentifier extends TagLengthString {
  /// Bakong Account Id
  final BakongAccountId bakongAccountId;

  /// Merchant Id
  final MerchantId? merchantId;

  /// Acquiring Bank
  final AcquiringBank? acquiringBank;

  /// Account Information
  final AccountInformation? accountInformation;

  /// Data
  final Map<String, dynamic> data;

  /// Global Unique Identifier Constructor
  GlobalUniqueIdentifier(String tag, Map<String, dynamic> valueObject)
    : bakongAccountId = BakongAccountId(
        EMV.bakongAccountIdentifier,
        valueObject['bakongAccountID'] ?? '',
      ),
      merchantId = valueObject['merchantID'] != null
          ? MerchantId(
              EMV.merchantAccountInformationMerchantId,
              valueObject['merchantID'],
            )
          : null,
      acquiringBank = valueObject['acquiringBank'] != null
          ? AcquiringBank(
              EMV.merchantAccountInformationAcquiringBank,
              valueObject['acquiringBank'],
            )
          : null,
      accountInformation = valueObject['accountInformation'] != null
          ? AccountInformation(
              EMV.individualAccountInformation,
              valueObject['accountInformation'],
            )
          : null,
      data = valueObject,
      super(tag, _buildGlobalUniqueIdentifierString(valueObject)) {
    if (valueObject['bakongAccountID'] == null) {
      throw KhqrResponse.error(ErrorCode.merchantTypeRequired);
    }
  }

  static String _buildGlobalUniqueIdentifierString(
    Map<String, dynamic> valueObject,
  ) {
    final bakongAccountId = BakongAccountId(
      EMV.bakongAccountIdentifier,
      valueObject['bakongAccountID'] ?? '',
    );

    String globalUniqueIdentifier = bakongAccountId.toString();

    final isMerchant = valueObject['isMerchant'] == true;

    if (isMerchant) {
      if (valueObject['merchantID'] != null) {
        final merchantId = MerchantId(
          EMV.merchantAccountInformationMerchantId,
          valueObject['merchantID'],
        );
        globalUniqueIdentifier += merchantId.toString();
      }

      if (valueObject['acquiringBank'] != null) {
        final acquiringBankName = AcquiringBank(
          EMV.merchantAccountInformationAcquiringBank,
          valueObject['acquiringBank'],
        );
        globalUniqueIdentifier += acquiringBankName.toString();
      }
    } else {
      if (valueObject['accountInformation'] != null) {
        final accInformation = AccountInformation(
          EMV.individualAccountInformation,
          valueObject['accountInformation'],
        );
        globalUniqueIdentifier += accInformation.toString();
      }

      if (valueObject['acquiringBank'] != null) {
        final acquiringBankName = AcquiringBank(
          EMV.merchantAccountInformationAcquiringBank,
          valueObject['acquiringBank'],
        );
        globalUniqueIdentifier += acquiringBankName.toString();
      }
    }

    return globalUniqueIdentifier;
  }
}
