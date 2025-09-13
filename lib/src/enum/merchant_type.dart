/// Merchant Type Enum
/// - [MerchantType.individual] individual (29)
/// - [MerchantType.merchant] merchant (30)
enum MerchantType {
  /// individual (29)
  individual('29'),

  /// merchant (30)
  merchant('30');

  /// Tag value
  final String tag;
  const MerchantType(this.tag);
}
