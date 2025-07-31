//
//  MerchantAccount.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import "MerchantAccount.h"
#import "KHQRMerchantPresentedCodes.h"
#import "KHQRException.h"
#import "Constants.h"
#import "MerchantID.h"
#import "AcquiringBank.h"
#import "AccountInformation.h"

@interface MerchantAccount()

@property (strong, nonatomic) NSString * accountId;
@property (nonatomic) QRType type;

@property (strong, nonatomic) AccountInformation * accountInfoObj;
@property (strong, nonatomic) MerchantID * merchantIdObj;
@property (strong, nonatomic) AcquiringBank * acquiringBankObj;

typedef enum {
    MerchantIdRequired,
    AcquiringBankRequired,
    TagNotInOrder
} MerchantAccountExceptionType;

@end

@implementation MerchantAccount

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id _Null_unspecified)initWithAccountId  : (NSString *)accountId
                        accountInformation: (NSString *)accountInfo
                             acquiringBank: (NSString *)acquiringBank {
    self = [super init];
    if (self) {
        NSString * accountIdTrimValue = [Constants trimWhiteSpace: accountId];
        [self checkException: accountIdTrimValue];
        _accountId = accountIdTrimValue;
        _type = Individual;
        if (!IsEmpty(accountInfo)) {
            _accountInfoObj = [[AccountInformation alloc] initWithinfo: accountInfo];
        }
        if (!IsEmpty(acquiringBank)) {
            _acquiringBankObj = [[AcquiringBank alloc] initWithAcquiringBank: acquiringBank];
        }
        
    }
    return self;
}

-(id _Null_unspecified)initWithAccountId  :(NSString *)accountId
                                merchantId: (NSString *)merchantId
                             acquiringBank: (NSString *)acquiringBank {
    self = [super init];
    if (self) {
        NSString * accountIdTrimValue = [Constants trimWhiteSpace: accountId];
        [self checkException: accountIdTrimValue];
        _accountId = accountIdTrimValue;
        _type = Merchant;
        _merchantIdObj = [[MerchantID alloc] initWithId: merchantId];
        _acquiringBankObj = [[AcquiringBank alloc] initWithAcquiringBank: acquiringBank];
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex:2];
    NSString * remaningQR = @"";
    
    [self checkDuplicateSubTag: qr];
    
    if ([@[@"29", @"30"] containsObject: tagFromQR]) {
        _type = [tagFromQR isEqualToString: @"29"] ? Individual  : Merchant;
        
        if ([tagFromQR isEqualToString: self.tag]) {
            remaningQR = [Constants replaceString: qr withEmptyStringToIndex: 2];
            
            // get total length
            NSInteger totalLength = [Constants subString: remaningQR toIndex:2].intValue;
            remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
            
            // get merchant acc qr
            NSString * merchantAccQR = [Constants subString: remaningQR toIndex:totalLength];
            
            // remaning qr for returning
            remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: totalLength];
            do {
                NSString * cTag = [Constants subString: merchantAccQR toIndex:2];
                merchantAccQR = [Constants replaceString: merchantAccQR withEmptyStringToIndex:2];
                // sub length
                NSInteger subLength = [Constants subString: merchantAccQR toIndex:2].intValue;
                merchantAccQR = [Constants replaceString: merchantAccQR withEmptyStringToIndex: 2];

                // value
                NSString * valueTag = [Constants subString: merchantAccQR toIndex: subLength];
                
//                NSLog(@"%@", cTag);
//
//                NSLog(@"%@", valueTag);
//
//                NSLog(@"%02d", subLength);
//
//                NSLog(@"%@", merchantAccQR);
                
                if ([@[@"00", @"01", @"02"] containsObject: cTag]) {
                    // do the work
                    if ([cTag isEqualToString: @"00"]) {
                        _accountId = valueTag;
                        [self checkException: _accountId];
                        merchantAccQR = [Constants replaceString: merchantAccQR withEmptyStringToIndex: subLength];
                    } else if ([cTag isEqualToString: @"01"] || [cTag isEqualToString: @"02"]) {
                        NSString * merchantAccWithTag = [NSString stringWithFormat:@"%@%02ld%@", cTag, (long)subLength, merchantAccQR];
                        merchantAccQR = [self decodeSubData: merchantAccWithTag];
                    }
                } else {
                    // sub tag not 01 and 02 tag
                    merchantAccQR = [Constants replaceString: merchantAccQR withEmptyStringToIndex: subLength];
//                    NSLog(@"%@", merchantAccQR);
                }
            } while(merchantAccQR.length > 0);
            // return the remaning qr code
            return remaningQR;
        }
    } else {
        // no throw exception when decoding
        if (Constants.shared.isDecoding) {
            return remaningQR;
        }
        KHQRException * accRequiredException = [[KHQRException alloc] initWithReason: merchantTypeRequired
                                                                           errorCode: [ErrorConstants merchantTypeRequiredCode]];
        [accRequiredException raise];
    }
    return qr;
}

#pragma mark - Helper functions
-(void) throwSubQrException: (MerchantAccountExceptionType) exceptionType{
    // no throw exception when decoding
    if (Constants.shared.isDecoding || _type == Individual) {
        return;
    }
    
    switch (exceptionType) {
        case MerchantIdRequired:
            [self throwMerchantIdRequiredExption];
            break;
        case AcquiringBankRequired:
            [self throwAcquiringBankRequiredException];
            break;
        default:
            [self throwTagNotInOrderException];
            break;
    }
}

-(void) throwMerchantIdRequiredExption {
    KHQRException * exception = [[KHQRException alloc] initWithReason: merchantIdrequired
                                                            errorCode: [ErrorConstants merchantIdRequiredCode]];
    [exception raise];
}
-(void) throwAcquiringBankRequiredException {
    KHQRException * exception = [[KHQRException alloc] initWithReason: acquiringBankRequired
                                                            errorCode: [ErrorConstants acquiringBankRequiredCode]];
    [exception raise];
}
-(void) throwTagNotInOrderException {
    KHQRException * exception = [[KHQRException alloc] initWithReason: tagNotInOrder
                                                            errorCode: [ErrorConstants tagNotInOrderCode]];
    [exception raise];
}

-(void) checkDuplicateSubTag: (NSString *)qr {
    if (Constants.shared.isDecoding) {
        return;
    }
    
    NSString * remaningTag = qr;
    // remove account tag, total length, and global identifier
    remaningTag = [Constants replaceString:remaningTag withEmptyStringToIndex: 6];
    NSString * accIdlength = [Constants subString:remaningTag toIndex: 2];
    remaningTag = [Constants replaceString:remaningTag withEmptyStringToIndex: 2];
    // remove account id
    remaningTag = [Constants replaceString:remaningTag withEmptyStringToIndex: accIdlength.intValue];
        
    if (IsEmpty(remaningTag) == FALSE) {
        NSString * previousTag = @"0";
        NSMutableDictionary * taglist = [[NSMutableDictionary alloc] init];
        BOOL isContinue = TRUE;
        do {
            NSString * tag = [Constants subString:remaningTag toIndex: 2];
            remaningTag = [Constants replaceString:remaningTag withEmptyStringToIndex: 2];
            NSString * length = [Constants subString:remaningTag toIndex: 2];
            remaningTag = [Constants replaceString: remaningTag withEmptyStringToIndex: 2];
            NSString * value = [Constants subString:remaningTag toIndex: length.intValue];
            remaningTag = [Constants replaceString: remaningTag withEmptyStringToIndex: length.intValue];
            NSString * tagLengthValue = [NSString stringWithFormat:@"%@%@%@", tag, length, value];
        
            if ([taglist objectForKey: tag]) {
                // key already existed found duplicated tag, throw error invalid qr
                KHQRException * exception = [[KHQRException alloc] initWithReason:
                                             qrInvalid
                                        errorCode: [ErrorConstants qrInvalidCode]];
                [exception raise];
            }
            [taglist setValue:tagLengthValue forKey: tag];
            previousTag = tag;
            if (IsEmpty(remaningTag)) {
                isContinue = false;
            }
        } while (isContinue);
    }
}

-(NSString *)decodeSubData: (NSString *) qr{
    if (IsEmpty(qr)) {
        if (_type == Merchant) {
            [self throwSubQrException: MerchantIdRequired];
        }
        return @"";
    }
    NSArray *tags = @[@"01", @"02"];
    NSString *subQr = @"";
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * previouTag = @"0";
    
//    NSLog(@"%@", qr);
    
    for (tag in tags) {
        // check subtag not in order
        //        if (tagFromQR.intValue < previouTag.intValue && !IsEmpty(tagFromQR)) {
        //            [self throwSubQrException: TagNotInOrder];
        //        }
        
        //        // check subtag required
        
//        NSLog(@"%@", tag);
//        NSLog(@"%@", subQr);
//        NSLog(@"%@", previouTag);
        
        if (Constants.shared.isDecoding == FALSE) {
            if (![tagFromQR isEqualToString:@"01"] &&
                ![tagFromQR isEqualToString:@"02"]) {
                if (_merchantIdObj == NULL) {
                    [self throwSubQrException: MerchantIdRequired];
                } else {
                    [self throwSubQrException: AcquiringBankRequired];
                }
            }
        }
        
        if ([tagFromQR isEqualToString: @"01"]) { // merchant id or accountInformation
            if (_type == Individual) {
                if (_accountInfoObj == NULL) {
                    _accountInfoObj = [[AccountInformation alloc] init];
                }
                subQr = [_accountInfoObj decodeWithQr: qr];
            } else {
                if (_merchantIdObj == NULL) {
                    _merchantIdObj = [[MerchantID alloc] init];
                }
                subQr = [_merchantIdObj decodeWithQr: qr];
            }
        }
        else if ([tagFromQR isEqualToString: @"02"]) { // acquiring bank
            if (_acquiringBankObj == NULL) {
                _acquiringBankObj = [[AcquiringBank alloc] init];
            }
            subQr = [_acquiringBankObj decodeWithQr: IsEmpty(subQr) ? qr : subQr];
        }
        previouTag = tagFromQR;
        
        if (IsEmpty(subQr) == FALSE) {
            tagFromQR = [Constants subString: subQr toIndex: 2];
        } else {
            tagFromQR = @"";
        }
    }
    return subQr;
}

-(void) checkException: (NSString *) cAccountId {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL checkRequired __unused = [Constants checkEmptyOrNullException: cAccountId reason: accountIdRequired];
    BOOL checkLength __unused = [Constants checkLengthException: cAccountId reason: accountIdLengthInvalid];
    BOOL checkInvalidAccId __unused = [self checkValidAccountException: cAccountId];
}

-(BOOL) checkValidAccountException: (NSString *)cAccountId {
    if ([self isValidAccount: cAccountId] == FALSE) {
        KHQRException * exception = [[KHQRException alloc] initWithReason: accountIdInvalid
                                                                errorCode: [ErrorConstants accountIdInvalidCode]];
        [exception raise];
    }
    return TRUE;
}

-(BOOL) isValidAccount: (NSString *)cAccountId {
    NSString *regex = @"^[^@]+[@]{1}[^@]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [predicate evaluateWithObject: cAccountId];
}

#pragma mark - Get/Set
-(QRType) getType {
    return _type;
}
-(NSString *) getAccountInformation {
    return [_accountInfoObj value];
}

-(NSString *) getAccountId {
    return _accountId;
}
-(NSString *) getMerchantId {
    return [_merchantIdObj value];
}
-(NSString *) getAcquiringBank {
    return [_acquiringBankObj value];
}

#pragma mark - Protocol
-(NSString *) tag {
    return _type == Individual ? INDIVIDUAL : MERCHANT;
}

-(NSString *) value {
    NSMutableString * payload = [[NSMutableString alloc] init];
    [payload appendString: _accountId];
    if (_merchantIdObj) {
        [payload appendString: [_merchantIdObj toString]];
    }
    if (_accountInfoObj) {
        [payload appendString: [_accountInfoObj toString]];
    }
    if (_acquiringBankObj) {
        [payload appendString: [_acquiringBankObj toString]];
    }
    return payload;
}

-(NSString *) toString {
    NSString * globalIdentifier = GLOBALLY_UNIQUE_IDENTIFIER;
    long totalLengthCount = self.tag.length + globalIdentifier.length + self.value.length;
    
    NSString * totalLengthString = [NSString stringWithFormat:@"%02ld", totalLengthCount];
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", _accountId.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@%@%@",
                               self.tag, totalLengthString, globalIdentifier, lengthString, self.value];
    return toStringValue;
}

@end
