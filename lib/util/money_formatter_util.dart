import 'package:money2/money2.dart';

class MoneyFormatterUtil {
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
