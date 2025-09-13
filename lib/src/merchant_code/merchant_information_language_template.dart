import '../constant/emv.dart';
import '../constant/error_code.dart';
import '../model/khqr_response.dart';
import '../model/tag_length_string.dart';

/// Language Preference Class
class LanguagePreference extends TagLengthString {
  /// Language Preference Constructor
  LanguagePreference(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['languagePreference']! ||
        value.isEmpty) {
      throw KhqrResponse.error(ErrorCode.languagePreferenceLengthInvalid);
    }
  }
}

/// Merchant Name Alternate Language Class
class MerchantNameAlternateLanguage extends TagLengthString {
  /// Merchant Name Alternate Language Constructor
  MerchantNameAlternateLanguage(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['merchantNameAlternateLanguage']! ||
        value.isEmpty) {
      throw KhqrResponse.error(
        ErrorCode.merchantNameAlternateLanguageLengthInvalid,
      );
    }
  }
}

/// Merchant City Alternate Language Class
class MerchantCityAlternateLanguage extends TagLengthString {
  /// Merchant City Alternate Language Constructor
  MerchantCityAlternateLanguage(String tag, String value) : super(tag, value) {
    if (value.length > EMV.invalidLength['merchantCityAlternateLanguage']! ||
        value.isEmpty) {
      throw KhqrResponse.error(
        ErrorCode.merchantCityAlternateLanguageLengthInvalid,
      );
    }
  }
}

/// Merchant Information Language Template Class
class MerchantInformationLanguageTemplate extends TagLengthString {
  /// Language Preference
  final LanguagePreference? languagePreference;

  /// Merchant Name Alternate Language
  final MerchantNameAlternateLanguage? merchantNameAlternateLanguage;

  /// Merchant City Alternate Language
  final MerchantCityAlternateLanguage? merchantCityAlternateLanguage;

  /// Data
  final Map<String, dynamic> data;

  /// Merchant Information Language Template Constructor
  MerchantInformationLanguageTemplate(String tag, Map<String, dynamic>? value)
    : languagePreference = value?['languagePreference'] != null
          ? LanguagePreference(
              EMV.languagePreference,
              value!['languagePreference'],
            )
          : null,
      merchantNameAlternateLanguage =
          value?['merchantNameAlternateLanguage'] != null
          ? MerchantNameAlternateLanguage(
              EMV.merchantNameAlternateLanguage,
              value!['merchantNameAlternateLanguage'],
            )
          : null,
      merchantCityAlternateLanguage =
          value?['merchantCityAlternateLanguage'] != null
          ? MerchantCityAlternateLanguage(
              EMV.merchantCityAlternateLanguage,
              value!['merchantCityAlternateLanguage'],
            )
          : null,
      data = value ?? {},
      super(tag, _buildLanguageTemplateString(value)) {
    // Validation: if languagePreference is provided, merchantNameAlternateLanguage is required
    if (value != null &&
        value['languagePreference'] != null &&
        value['merchantNameAlternateLanguage'] == null) {
      throw KhqrResponse.error(ErrorCode.merchantNameAlternateLanguageRequired);
    }
  }

  static String _buildLanguageTemplateString(Map<String, dynamic>? value) {
    if (value == null) return '';

    String languageTemplateString = '';

    // Add language preference first (if merchantNameAlternateLanguage exists)
    if (value['merchantNameAlternateLanguage'] != null) {
      final preference = LanguagePreference(
        EMV.languagePreference,
        value['languagePreference'] ?? 'en',
      );
      languageTemplateString += preference.toString();
    }

    if (value['merchantNameAlternateLanguage'] != null) {
      final alterName = MerchantNameAlternateLanguage(
        EMV.merchantNameAlternateLanguage,
        value['merchantNameAlternateLanguage'],
      );
      languageTemplateString += alterName.toString();
    }

    if (value['merchantCityAlternateLanguage'] != null) {
      final alterCity = MerchantCityAlternateLanguage(
        EMV.merchantCityAlternateLanguage,
        value['merchantCityAlternateLanguage'],
      );
      languageTemplateString += alterCity.toString();
    }

    return languageTemplateString;
  }
}
