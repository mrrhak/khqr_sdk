//
//  KHQRMerchantPresentedCodes.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import "KHQRMerchantPresentedCodes.h"

@implementation KHQRMerchantPresentedCodes

#pragma mark - QR Convention
NSString * const PAYLOAD_FORMAT_INDICATOR = @"00"; // M
NSString * const POINT_OF_INITIATION_METHOD = @"01"; // 0

#pragma mark - Merchant Account Information
NSString * const INDIVIDUAL = @"29";
NSString * const MERCHANT = @"30";
NSString * const MERCHANT_ID = @"01";
NSString * const ACCOUNT_INFORMATION = @"01";
NSString * const ACQUIRING_BANK = @"02";

NSString * const GLOBALLY_UNIQUE_IDENTIFIER = @"00"; // M
NSString * const MERCHANT_CATEGORY_CODE = @"52"; // M
NSString * const TRANSACTION_CURRENCY = @"53"; // M
NSString * const TRANSACTION_AMOUNT = @"54"; // C
NSString * const COUNTRY_CODE = @"58"; // M
NSString * const MERCHANT_NAME = @"59"; // M
NSString * const MERCHANT_CITY = @"60"; // M

// For dynamic QR
#pragma mark - Additional Data Fields
NSString * const ADDITIONAL_DATA_FIELD_TEMPLATE = @"62"; // O
NSString * const BILL_NUMBER = @"01"; // O
NSString * const MOBILE_NUMBER = @"02"; // O
NSString * const STORE_LABEL = @"03"; // O
NSString * const TERMINAL_LABEL = @"07"; // O
NSString * const PURPOSE_OF_TRANSACTION = @"08"; // O

// For merchant language template
#pragma mark - Merchant language template
NSString * const MERCHANT_LANGUAGE_TEMPLATE = @"64"; // O
NSString * const MERCHANT_LANGUAGE_PREFERENCE = @"00"; // required only if set merchant name and city in other language beside english
NSString * const MERCHANT_NAME_ALTERNATE_LANGUAGE = @"01"; // 0
NSString * const MERCHANT_CITY_ALTERNATE_LANGUAGE = @"02"; // 0

#pragma mark - CRC
NSString * const CRC_TAG = @"63"; // M

#pragma mark - Reserve For Future Use
NSString * const RFU_TAG = @"99"; // M
NSString * const RFU_GLOBALLY_UNIQUE_IDENTIFIER = @"00"; // M
NSString * const RFU_EXPIRATION_TIMESTAMP = @"01";


#pragma mark - UPI
NSString * const UNION_PAY = @"15"; // 0

@end
