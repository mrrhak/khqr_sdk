//
//  ValueLengthConstants.h
//  BakongKHQR
//
//  Created by Seth Sambo on 2/22/21.
//

#import <Foundation/Foundation.h>

@interface ValueLengthConstants : NSObject

extern short const MERCHANT_ACCOUNT_ID_LENGTH; // same as TGLOBALLY_UNIQUE_IDENTIFIER_LENGTH
extern short const TRANSACTION_AMOUNT_LENGTH;
extern short const MERCHANT_NAME_LENGTH;
extern short const BILL_NUMBER_LENGTH;
extern short const STORE_LABEL_LENGTH;
extern short const TERMINAL_LABEL_LENGTH;
extern short const PURPOSE_OF_TRANSACTION_LENGTH;
extern short const FORMAT_INDICATOR_LENGTH;
extern short const POINT_OF_INITIALIZE_LENGTH;
extern short const MERCHANT_CATEGORY_CODE_LENGTH;
extern short const TRANSACTION_CURRENCY_LENGTH;
extern short const COUNTRY_CODE_LENGTH;
extern short const MERCHANT_CITY_LENGTH;
extern short const CRC_LENGTH;
extern short const MERCHANT_ID_LENGTH;
extern short const ACCOUNT_INFORMATION_LENGTH;
extern short const ACQUIRING_BANK_LENGTH;
extern short const MOBILE_NUMBER_LENGTH;
extern short const MERCHANT_LANGUAGE_PREFERENCE_LENGTH;
extern short const MERCHANT_NAME_ALTERNATE_LANGUAGE_LENGTH;
extern short const MERCHANT_CITY_ALTERNATE_LANGUAGE_LENGTH;
extern short const UPI_ACCOUNT_INFORMATION_LENGTH;
extern short const RESERVE_FOR_TIMESTAMP_LENGHT;

@end
