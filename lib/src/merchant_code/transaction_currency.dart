import '../constant/error_code.dart';
import '../enum/khqr_currency.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Transaction Currency Class
class TransactionCurrency extends TagLengthString {
  /// Transaction Currency Constructor
  TransactionCurrency(String tag, String value) : super(tag, value) {
    if (value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.currencyTypeRequired);
    }
    if (value.length > 3) {
      throw KhqrResponse.error(ErrorCode.transactionCurrencyLengthInvalid);
    }

    final currencyCode = int.tryParse(value);
    final availableCurrencies = KhqrCurrency.values
        .map((c) => c.value)
        .toList();
    if (currencyCode == null || !availableCurrencies.contains(currencyCode)) {
      throw KhqrResponse.error(ErrorCode.unsupportedCurrency);
    }
  }
}
