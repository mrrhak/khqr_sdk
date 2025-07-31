//
//  KHQRMerchantPresentedCodes.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/10/20.
//

#import <Foundation/Foundation.h>

@interface KHQRMerchantPresentedCodes: NSObject

extern NSString * const PAYLOAD_FORMAT_INDICATOR;
extern NSString * const POINT_OF_INITIATION_METHOD;

extern NSString * const INDIVIDUAL;
extern NSString * const MERCHANT;
extern NSString * const MERCHANT_ID;
extern NSString * const ACCOUNT_INFORMATION;
extern NSString * const ACQUIRING_BANK;

extern NSString * const GLOBALLY_UNIQUE_IDENTIFIER;
extern NSString * const MERCHANT_CATEGORY_CODE;
extern NSString * const TRANSACTION_CURRENCY;
extern NSString * const TRANSACTION_AMOUNT;
extern NSString * const COUNTRY_CODE;
extern NSString * const MERCHANT_NAME;
extern NSString * const MERCHANT_CITY;

extern NSString * const CRC_TAG;

extern NSString * const ADDITIONAL_DATA_FIELD_TEMPLATE;
extern NSString * const BILL_NUMBER;
extern NSString * const MOBILE_NUMBER;
extern NSString * const STORE_LABEL;
extern NSString * const TERMINAL_LABEL;
extern NSString * const PURPOSE_OF_TRANSACTION;

extern NSString * const MERCHANT_LANGUAGE_TEMPLATE;
extern NSString * const MERCHANT_LANGUAGE_PREFERENCE;
extern NSString * const MERCHANT_NAME_ALTERNATE_LANGUAGE;
extern NSString * const MERCHANT_CITY_ALTERNATE_LANGUAGE;

extern NSString * const RFU_TAG; // M
extern NSString * const RFU_GLOBALLY_UNIQUE_IDENTIFIER; // M
extern NSString * const RFU_EXPIRATION_TIMESTAMP; // M

extern NSString * const UNION_PAY;

@end
