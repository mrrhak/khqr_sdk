import '../merchant_code/additional_data.dart';
import '../merchant_code/country_code.dart';
import '../merchant_code/crc.dart';
import '../merchant_code/global_unique_identifier.dart';
import '../merchant_code/merchant_category_code.dart';
import '../merchant_code/merchant_city.dart';
import '../merchant_code/merchant_information_language_template.dart';
import '../merchant_code/merchant_name.dart';
import '../merchant_code/payload_format_indicator.dart';
import '../merchant_code/point_of_initiation_method.dart';
import '../merchant_code/time_stamp.dart';
import '../merchant_code/transaction_amount.dart';
import '../merchant_code/transaction_currency.dart';
import '../merchant_code/union_pay_merchant.dart';

/// KHQR Tag Class
class KhqrTag {
  /// Tag
  final String tag;

  /// Sub
  final bool sub;

  /// Type
  final String type;

  /// Required
  final bool required;

  /// Instance
  final dynamic instance;

  /// KHQR Tag Constructor
  const KhqrTag({
    required this.tag,
    required this.sub,
    required this.type,
    required this.required,
    required this.instance,
  });

  /// KHQR Tag List
  static const List<KhqrTag> tags = [
    KhqrTag(
      tag: '00',
      sub: false,
      type: 'payloadFormatIndicator',
      required: true,
      instance: PayloadFormatIndicator,
    ),
    KhqrTag(
      tag: '01',
      sub: false,
      type: 'pointOfInitiationMethod',
      required: false,
      instance: PointOfInitiationMethod,
    ),
    KhqrTag(
      tag: '15',
      sub: false,
      type: 'unionPayMerchant',
      required: false,
      instance: UnionPayMerchant,
    ),
    KhqrTag(
      tag: '29',
      sub: false,
      type: 'globalUniqueIdentifier',
      required: true,
      instance: GlobalUniqueIdentifier,
    ),
    KhqrTag(
      tag: '52',
      sub: false,
      type: 'merchantCategoryCode',
      required: true,
      instance: MerchantCategoryCode,
    ),
    KhqrTag(
      tag: '53',
      sub: false,
      type: 'transactionCurrency',
      required: true,
      instance: TransactionCurrency,
    ),
    KhqrTag(
      tag: '54',
      sub: false,
      type: 'transactionAmount',
      required: false,
      instance: TransactionAmount,
    ),
    KhqrTag(
      tag: '58',
      sub: false,
      type: 'countryCode',
      required: true,
      instance: CountryCode,
    ),
    KhqrTag(
      tag: '59',
      sub: false,
      type: 'merchantName',
      required: true,
      instance: MerchantName,
    ),
    KhqrTag(
      tag: '60',
      sub: false,
      type: 'merchantCity',
      required: true,
      instance: MerchantCity,
    ),
    KhqrTag(
      tag: '62',
      sub: true,
      type: 'additionalData',
      required: false,
      instance: AdditionalData,
    ),
    KhqrTag(tag: '63', sub: false, type: 'crc', required: true, instance: CRC),
    KhqrTag(
      tag: '64',
      sub: true,
      type: 'merchantInformationLanguageTemplate',
      required: false,
      instance: MerchantInformationLanguageTemplate,
    ),
    KhqrTag(
      tag: '99',
      sub: true,
      type: 'timestamp',
      required: false,
      instance: TimeStamp,
    ),
  ];
}
