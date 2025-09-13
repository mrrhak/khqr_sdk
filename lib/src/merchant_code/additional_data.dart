import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Bill Number Class
class BillNumber extends TagLengthString {
  /// Bill Number Constructor
  BillNumber(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['billNumber']! || value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.billNumberLengthInvalid);
    }
  }
}

/// Store Label Class
class StoreLabel extends TagLengthString {
  /// Store Label Constructor
  StoreLabel(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['storeLabel']! || value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.storeLabelLengthInvalid);
    }
  }
}

/// Terminal Label Class
class TerminalLabel extends TagLengthString {
  /// Terminal Label Constructor
  TerminalLabel(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['terminalLabel']! || value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.terminalLabelLengthInvalid);
    }
  }
}

/// Mobile Number Class
class MobileNumber extends TagLengthString {
  /// Mobile Number Constructor
  MobileNumber(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['mobileNumber']! || value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.mobileNumberLengthInvalid);
    }
  }
}

/// Purpose of Transaction Class
class PurposeOfTransaction extends TagLengthString {
  /// Purpose of Transaction Constructor
  PurposeOfTransaction(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['purposeOfTransaction']! ||
        value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.purposeOfTransactionLengthInvalid);
    }
  }
}

/// Additional Data Class
class AdditionalData extends TagLengthString {
  /// Bill Number
  final BillNumber? billNumber;

  /// Mobile Number
  final MobileNumber? mobileNumber;

  /// Store Label
  final StoreLabel? storeLabel;

  /// Terminal Label
  final TerminalLabel? terminalLabel;

  /// Purpose of Transaction
  final PurposeOfTransaction? purposeOfTransaction;

  /// Additional Data Map
  final Map<String, dynamic> data;

  /// Additional Data Constructor
  AdditionalData(String tag, Map<String, dynamic>? additionalData)
    : billNumber = additionalData?['billNumber'] != null
          ? BillNumber(EMV.billNumberTag, additionalData!['billNumber'])
          : null,
      mobileNumber = additionalData?['mobileNumber'] != null
          ? MobileNumber(
              EMV.additionalDataFieldMobileNumber,
              additionalData!['mobileNumber'],
            )
          : null,
      storeLabel = additionalData?['storeLabel'] != null
          ? StoreLabel(EMV.storeLabelTag, additionalData!['storeLabel'])
          : null,
      terminalLabel = additionalData?['terminalLabel'] != null
          ? TerminalLabel(EMV.terminalTag, additionalData!['terminalLabel'])
          : null,
      purposeOfTransaction = additionalData?['purposeOfTransaction'] != null
          ? PurposeOfTransaction(
              EMV.purposeOfTransaction,
              additionalData!['purposeOfTransaction'],
            )
          : null,
      data = additionalData ?? {},
      super(tag, _buildAdditionalDataString(additionalData));

  static String _buildAdditionalDataString(
    Map<String, dynamic>? additionalData,
  ) {
    if (additionalData == null) return '';

    String additionalDataString = '';

    if (additionalData['billNumber'] != null) {
      final billNumber = BillNumber(
        EMV.billNumberTag,
        additionalData['billNumber'],
      );
      additionalDataString += billNumber.toString();
    }

    if (additionalData['mobileNumber'] != null) {
      final mobileNumber = MobileNumber(
        EMV.additionalDataFieldMobileNumber,
        additionalData['mobileNumber'],
      );
      additionalDataString += mobileNumber.toString();
    }

    if (additionalData['storeLabel'] != null) {
      final storeLabel = StoreLabel(
        EMV.storeLabelTag,
        additionalData['storeLabel'],
      );
      additionalDataString += storeLabel.toString();
    }

    if (additionalData['terminalLabel'] != null) {
      final terminalLabel = TerminalLabel(
        EMV.terminalTag,
        additionalData['terminalLabel'],
      );
      additionalDataString += terminalLabel.toString();
    }

    if (additionalData['purposeOfTransaction'] != null) {
      final purpose = PurposeOfTransaction(
        EMV.purposeOfTransaction,
        additionalData['purposeOfTransaction'],
      );
      additionalDataString += purpose.toString();
    }

    return additionalDataString;
  }
}
