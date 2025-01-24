/// KHQR Currency Enum
/// - [KhqrCurrency.khr] Riel (KHR) - 116
/// - [KhqrCurrency.usd] Dollar (USD) - 840
enum KhqrCurrency {
  /// Riel (KHR) - 116
  khr(116),

  /// Dollar (USD) - 840
  usd(840);

  const KhqrCurrency(this.value);

  /// The value of the enum
  final int value;
}
