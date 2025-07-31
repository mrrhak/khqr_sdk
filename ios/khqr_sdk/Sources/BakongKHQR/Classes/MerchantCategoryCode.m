//
//  MerchantCategoryCode.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import "MerchantCategoryCode.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface MerchantCategoryCode()

@property (strong, nonatomic) NSString * categoryCode;

@end

@implementation MerchantCategoryCode

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithCode :(NSString *)categoryCode {
    self = [super init];
    if (self) {
        [self checkException: categoryCode];
        _categoryCode = categoryCode;
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
        
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [qr stringByReplacingCharactersInRange: NSMakeRange(0, 2) withString: @""];
        
        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        _categoryCode = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _categoryCode];
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex:valueLength];
        return remaningQR;
    } else {
        // no throw exception when decoding
        if (Constants.shared.isDecoding) {
            return remaningQR;
        }
        KHQRException * requiredException = [[KHQRException alloc] initWithReason: merchantCategoryCodeRequired
                                                                        errorCode: [ErrorConstants merchantCategoryCodeRequiredCode]];
        [requiredException raise];
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)cCategoryCode {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return ;
    }
    BOOL requiredException __unused = [Constants checkEmptyOrNullException: cCategoryCode reason: merchantCategoryCodeRequired];
    BOOL lengthException __unused = [Constants checkLengthException: cCategoryCode reason: merchantCategoryCodeLengthInvalid];
    BOOL validValueException __unused = [Constants checkValidValueException:cCategoryCode reason:merchantCategoryCodeInvalidValue];
}

#pragma mark - Protocols
-(NSString *) tag {
    return MERCHANT_CATEGORY_CODE;
}

-(NSString *) value {
    return _categoryCode;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
