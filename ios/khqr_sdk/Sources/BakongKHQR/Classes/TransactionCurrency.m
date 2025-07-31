//
//  TransactionCurrency.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import "TransactionCurrency.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface TransactionCurrency()

@property CurrencyType currency;

@end

@implementation TransactionCurrency

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithCurrency:(CurrencyType)currency {
    self = [super init];
    if (self) {
        // check and set default currency to khr
        if (currency != Khr && currency != Usd) {
            _currency = [Constants defaultCurrency];
        } else {
            _currency = currency;
        }
        [self checkException: [NSString stringWithFormat:@"%ld", (long)currency]];
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [Constants replaceString: qr withEmptyStringToIndex: 2];
        
        NSInteger valueLength =  [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        _currency = [Constants subString: remaningQR toIndex: valueLength].intValue;
        [self checkException: [NSString stringWithFormat:@"%ld", (long)_currency]];
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    } else {
        // no throw exception when decoding
        if (Constants.shared.isDecoding) {
            return remaningQR;
        }
        KHQRException * accRequiredException = [[KHQRException alloc] initWithReason: currencyTypeRequired
                                                                           errorCode: [ErrorConstants currencyTypeRequiredCode]];
        [accRequiredException raise];
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)cCurrencyString {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL requiredException __unused = [Constants checkEmptyOrNullException: cCurrencyString
                                                                    reason: currencyTypeRequired];
    BOOL lengthException __unused = [Constants checkLengthException: cCurrencyString
                                                             reason: transactionCurrencyLengthInvalid];

    if ([@[@"840", @"116"] containsObject: cCurrencyString] == FALSE) {
        KHQRException * accRequiredException = [[KHQRException alloc] initWithReason: unsupportedTransactionCurrency
                                                                           errorCode: [ErrorConstants unsupportedTransactionCurrencyCode]];
        [accRequiredException raise];
    }
}

#pragma mark - Protocols
-(NSString *) tag {
    return TRANSACTION_CURRENCY;
}

-(NSString *) value {
    return [NSString stringWithFormat:@"%ld", (long) _currency];
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
