import 'package:intl/intl.dart';

/// Utility class for formatting numbers
class NumberFormatterUtil {
  /// Format a given number to a string with thousand separators and at most two decimal places.
  ///
  /// If [alwaysShowDecimal] is true, the number will always be displayed with two decimal places.
  /// If false, the number will be displayed as an integer string if it has no decimal places.
  ///
  /// For example, if given the number 12345.678, the string returned will be '12,345.68'.
  /// If given the number 12345 with [alwaysShowDecimal] = true, the string returned will be '12,345.00'.
  static String formatThousandNumber(
    double number, {
    bool alwaysShowDecimal = false,
  }) {
    if (alwaysShowDecimal) {
      return NumberFormat('#,##0.00').format(number);
    }
    // Check if the number is an integer
    if (number == number.toInt()) {
      // Convert to integer string if there's no decimal
      return NumberFormat('#,##0').format(number);
    }

    // Keep up to two decimal places
    return NumberFormat('#,##0.##').format(number);
  }

  /// Remove all non-numeric characters from a given string and attempt to parse it to a double.
  ///
  /// If the string is null or empty, or if the string only contains '.', 0.0 is returned.
  ///
  /// Otherwise, the string is cleaned of all non-numeric characters and then parsed to a double.
  /// If the parsing fails, 0.0 is returned.
  static double cleanNumber(String? number) {
    // Remove all non-numeric characters
    if (number == null || number.isEmpty) return 0.0;
    number = number.replaceAll(RegExp('[^0-9.]+'), '');
    if (number == '.') return 0.0;
    return double.tryParse(number) ?? 0.0;
  }
}
