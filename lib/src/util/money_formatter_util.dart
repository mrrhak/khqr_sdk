import 'package:money2/money2.dart';

/// Utility class for formatting money
class MoneyFormatterUtil {
  /// Formats [amount] as US dollars with the specified [decimalDigits].
  ///
  /// If [showSymbol] is true, the [symbol] will be included in the formatted string.
  ///
  /// If [decimalDigits] is omitted, it defaults to 2.
  ///
  /// The default [symbol] is '$'.
  static Money dollarDisplayFormatter(
    num amount, {
    int? decimalDigits,
    String symbol = r'$',
    bool showSymbol = true,
  }) {
    final currency = Currency.create(
      'USD',
      decimalDigits ?? 2,
      symbol: symbol,
      groupSeparator: ',',
      decimalSeparator: '.',
      pattern: showSymbol ? 'S #,###.00' : '#,###.00',
    );

    final money = Money.fromNumWithCurrency(amount, currency);
    return money;
  }

  /// Formats [amount] as Khmer Riel with the specified [decimalDigits].
  ///
  /// If [showSymbol] is true, the [symbol] will be included in the formatted string.
  ///
  /// If [decimalDigits] is omitted, it defaults to 0.
  ///
  /// The default [symbol] is '៛'.
  static Money rielDisplayFormatter(
    num amount, {
    int? decimalDigits,
    String symbol = r'៛',
    bool showSymbol = true,
  }) {
    final currency = Currency.create(
      'KHR',
      decimalDigits ?? 0,
      symbol: symbol,
      groupSeparator: ',',
      decimalSeparator: '.',
      pattern: showSymbol ? '#,###.## S' : '#,###.##',
    );

    final money = Money.fromNumWithCurrency(amount, currency);
    return money;
  }
}
