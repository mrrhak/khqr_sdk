//
//  TransactionAmount.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import "TransactionAmount.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface TransactionAmount()

@property double amount;
@property CurrencyType currencyType;

@end

@implementation TransactionAmount

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithAmount :(double)amount currencyType: (CurrencyType)currencyType {
    self = [super init];
    if (self) {
        _amount = amount;
        _currencyType = currencyType;
        [self checkException: _amount];
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [Constants replaceString: qr withEmptyStringToIndex: 2];

        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        _amount = [Constants subString: remaningQR toIndex:valueLength].doubleValue;
        [self checkException: _amount];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (double) cAmount {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    
    // check negative number
    if (_amount < 0) {
        [self throwAmountInvalid];
    }
    
    // check length exception
    [self checkAmountInvalidLength];
    
    NSUInteger decimalPlaces = 0;
    if (_currencyType == Khr) {
        if (_amount - floor(_amount) > 0.00000000000001) {
            // Khr can't be decimal.
            [self throwAmountInvalid];
        }
    } else {
        // If user input 1.123 => Err amount
        decimalPlaces = [self countDecimalPlaces: _amount];
        if (decimalPlaces > 2) {
            [self throwAmountInvalid];
        }
    }
    NSString * format = @"%.0f";
    if (decimalPlaces == 1) {
        format = @"%.1f";
    } else if (decimalPlaces == 2 ){
        format = @"%.2f";
    }
    BOOL _ __unused = [Constants checkLengthException: [NSString stringWithFormat:format, _amount]
                                               reason: tranAmountInvalid];
    if (_currencyType == Khr) {
        if (_amount - floor(_amount) > 0.00000000000001) {
            // Khr can't be decimal.
            [self throwAmountInvalid];
        }
    } else {
        // If user input 1.123 => Err amount
        NSUInteger decimalPlaces = [self countDecimalPlaces: _amount];
        if (decimalPlaces > 2) {
            [self throwAmountInvalid];
        }
    }
}

-(void) checkAmountInvalidLength {
    NSNumber *num = [NSNumber numberWithDouble: _amount];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits: 15];
    NSString * amountAsString = [formatter stringFromNumber:num];
    [Constants checkLengthException: amountAsString
                            reason: tranAmountInvalid];
}

-(void) throwAmountInvalid {
    KHQRException * exception = [[KHQRException alloc] initWithReason: tranAmountInvalid
                                                            errorCode: [ErrorConstants tranAmountInvalidCode]];
    [exception raise];
}

- (NSUInteger)countDecimalPlaces:(double)number {
    NSNumber *num = [NSNumber numberWithDouble: number];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
//    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits: 15];
    NSString * resultString = [formatter stringFromNumber:num];
    NSScanner *theScanner = [NSScanner scannerWithString:resultString];
    NSString *decimalPoint = @".";
    NSString *unwanted = nil;
    [theScanner scanUpToString:decimalPoint intoString:&unwanted];

    NSUInteger numDecimalPlaces = (([resultString length] - [unwanted length]) > 0) ? [resultString length] - [unwanted length] - 1 : 0;
    return numDecimalPlaces;
}

#pragma mark - Protocol
-(NSString *) tag {
    return TRANSACTION_AMOUNT;
}

-(NSString *) value {
    NSString * format = @"%.0f";
    if (_currencyType == Usd) { // usd
        format = @"%.2f";
    } else { // khr
        return [NSString stringWithFormat: format, floor(_amount)];
    }
    return [NSString stringWithFormat: format,  _amount];
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
