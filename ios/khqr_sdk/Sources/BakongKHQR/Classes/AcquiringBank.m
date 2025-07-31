//
//  AcquiringBank.m
//  BakongKHQR
//
//  Created by Seth Sambo on 7/6/21.
//
#import "AcquiringBank.h"
#import "KHQRMerchantPresentedCodes.h"
#import "KHQRException.h"
#import "Constants.h"

@interface AcquiringBank()

@property (strong, nonatomic) NSString * bank;


@end

@implementation AcquiringBank
@synthesize tag;
@synthesize value;

#pragma mark - Init
- (id)initWithAcquiringBank:(NSString *)bank {
    self = [super init];
    if (self) {
        NSString * bankTrimValue = [Constants trimWhiteSpace: bank];
        [self checkException: bankTrimValue];
        _bank = bankTrimValue;
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

        _bank = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _bank];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *)acquiringBank {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    if (!Constants.shared.isGenerateIndividual) {
        // acquiringBank required only with cooperate merchant
        BOOL _ __unused = [Constants checkEmptyOrNullException: acquiringBank
                                                        reason: acquiringBankRequired];
    }
    BOOL __ __unused = [Constants checkLengthException: acquiringBank
                                               reason: acquiringBankLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return ACQUIRING_BANK;
}

-(NSString *) value {
    return _bank;
}

-(NSString *) toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
