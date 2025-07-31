//
//  MerchantCity.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import "MerchantCity.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface  MerchantCity()

@property (strong, nonatomic) NSString * city;

@end

@implementation MerchantCity

@synthesize tag;
@synthesize value;


#pragma mark - Init
-(id)initWithMerchantCity:(NSString *)city {
    self = [super init];
    if (self) {
        [self checkException: city];
        _city = city;
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
        
        _city = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _city];
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    } else {
        KHQRException * requiredException = [[KHQRException alloc] initWithReason: merchantCityRequired
                                                                        errorCode: [ErrorConstants merchantCityRequiredCode]];
        [requiredException raise];
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)cCity {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL requiredException __unused = [Constants checkEmptyOrNullException: cCity reason: merchantCityRequired];
    BOOL lengthException __unused = [Constants checkLengthException: cCity reason: merchantCityLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return MERCHANT_CITY;
}

-(NSString *) value {
    return _city;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end

