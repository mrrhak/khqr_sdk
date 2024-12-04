import 'package:intl/intl.dart';

/// Utility class for formatting money
class MoneyFormatterUtil {
  /// Format a given number to a string with thousand separators.
  ///
  /// The string will also keep up to two decimal places if the number is not an integer.
  /// Set [keepDecimal] to true to keep the decimal places even if the number is an integer.
  ///
  /// Example:
  ///
  ///   123456.78 -> 123,456.78
  ///
  ///   123456 -> 123,456
  static String formatThousandNumber(double number,
      {bool keepDecimal = false}) {
    // Check if the number is an integer
    if (number == number.toInt() && !keepDecimal) {
      // Convert to integer string if there's no decimal
      return NumberFormat('#,###').format(number);
    } else {
      // Keep up to two decimal places
      return NumberFormat('#,###.##').format(number);
    }
  }
}
