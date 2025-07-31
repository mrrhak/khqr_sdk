//
//  AdditionalData.m
//  BakongKHQR
//
//  Created by Seth Sambo on 2/6/21.
//

#import "BKAdditionalData.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface BKAdditionalData()

@property (nonatomic, strong) BillNumber * billNumberObj;
@property (nonatomic, strong) MobileNumber * mobileNumberObj;
@property (nonatomic, strong) StoreLabel * storeLabelObj;
@property (nonatomic, strong) TerminalLabel * terminalLabelObj;
@property (nonatomic, strong) PurposeOfTransaction * purposeOfTransactionObj;

@end

@implementation BKAdditionalData

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithBillNumber :(NSString *)billNumber storeLabel: (NSString *)storeLabel terminalLabel: (NSString *) terminalLabel purposeOfTransaction: (NSString *) purposeOfTransaction {
    self = [super init];
    if (self) {
        [self setBillNumber: billNumber];
        [self setStoreLabel: storeLabel];
        [self setTerminalLabel: terminalLabel];
        [self setPurposeOfTransaction: purposeOfTransaction];
    }
    return self;
}

#pragma mark - Decode 
-(NSString *)  decodeWithQr: (NSString *)qr {
    NSString * tagFromQR = [Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    
    [self checkDuplicateSubTag: qr];
    
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR = [Constants replaceString: qr withEmptyStringToIndex: 2];
        
        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        [self decodeSubData: [Constants subString: remaningQR toIndex: valueLength]];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Setter / Getter
-(void)setBillNumber: (NSString *)billNumber {
    _billNumberObj = [[BillNumber alloc] initWithBillNumber: billNumber];
}
-(NSString *) getBillNumber {
    return [_billNumberObj value];
}

-(void)setMobileNumber:(NSString *)mobileNumber {
    _mobileNumberObj = [[MobileNumber alloc] initWithMobileNumber: mobileNumber];
}
-(NSString *)getMobileNumber {
    return [_mobileNumberObj value];
}

-(void)setStoreLabel: (NSString *)storeLabel {
    _storeLabelObj = [[StoreLabel alloc] initWithStoreLabel: storeLabel];
}
-(NSString *) getStoreLabel {
    return [_storeLabelObj value];
}

-(void)setTerminalLabel: (NSString *)terminalLabel {
    _terminalLabelObj = [[TerminalLabel alloc] initWithTerminalLabel: terminalLabel];
}
-(NSString *) getTerminalLabel {
    return [_terminalLabelObj value];
}

-(void)setPurposeOfTransaction: (NSString *)purpose {
    _purposeOfTransactionObj = [[PurposeOfTransaction alloc] initWithPurpose: purpose];
}
-(NSString *) getPurposeOfTransaction {
    return [_purposeOfTransactionObj value];
}

#pragma mark - Helper function
-(void) checkDuplicateSubTag: (NSString *)qr {
    if (Constants.shared.isDecoding) {
        return;
    }
    NSString * remaningTag = qr;
    // remove account tag, total length
    remaningTag = [Constants replaceString:remaningTag withEmptyStringToIndex: 4];
        
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
        
//            NSLog(@"%@ | %@", tag, tagLengthValue);
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


-(void)decodeSubData: (NSString *) qr{
    NSString * remaningTag = qr;
    NSString * previousTag = @"0";
    BOOL isContinue = TRUE;
    do {
        NSString * tag = [Constants subString:remaningTag toIndex: 2];
        remaningTag = [Constants replaceString:remaningTag withEmptyStringToIndex: 2];
        NSString * length = [Constants subString:remaningTag toIndex: 2];
        remaningTag = [Constants replaceString: remaningTag withEmptyStringToIndex: 2];
        NSString * value = [Constants subString:remaningTag toIndex: length.intValue];
        remaningTag = [Constants replaceString: remaningTag withEmptyStringToIndex: length.intValue];
        NSString * tagLengthValue = [NSString stringWithFormat:@"%@%@%@", tag, length, value];
    
//        NSLog(@"tag: %@ | tagLengthValue: %@", tag, tagLengthValue);
        if ([tag isEqualToString: @"01"]) { // Bill number
            if (_billNumberObj == NULL) {
                _billNumberObj = [[BillNumber alloc] init];
            }
            [_billNumberObj decodeWithQr: tagLengthValue];
        }
        else if ([tag isEqualToString: @"02"]) { // Mobile number
            if (_mobileNumberObj == NULL) {
                _mobileNumberObj = [[MobileNumber alloc] init];
            }
            [_mobileNumberObj decodeWithQr: tagLengthValue];
        }
        else if ([tag isEqualToString: @"03"]) { // Store label
            if (_storeLabelObj == NULL) {
                _storeLabelObj = [[StoreLabel alloc] init];
            }
            [_storeLabelObj decodeWithQr: tagLengthValue];
        }
        else if ([tag isEqualToString: @"07"]) { // Terminal label
            if (_terminalLabelObj == NULL) {
                _terminalLabelObj = [[TerminalLabel alloc] init];
            }
            [_terminalLabelObj decodeWithQr: tagLengthValue];
        }
        else if ([tag isEqualToString: @"08"]) { // Purpose of transaction
            if (_purposeOfTransactionObj == NULL) {
                _purposeOfTransactionObj = [[PurposeOfTransaction alloc] init];
            }
            [_purposeOfTransactionObj decodeWithQr: tagLengthValue];
        }
        previousTag = tag;
        if (IsEmpty(remaningTag)) {
            isContinue = false;
        }
    } while (isContinue);
}

-(BOOL)IsEmpty {
    if (_billNumberObj || _storeLabelObj || _terminalLabelObj) {
        return FALSE;
    }
    return TRUE;
}

#pragma mark - Protocol
-(NSString *) tag {
    return ADDITIONAL_DATA_FIELD_TEMPLATE;
}

-(NSString *) value {
    NSMutableString * payload = [[NSMutableString alloc] init];
    if (_billNumberObj) {
        [payload appendString: [_billNumberObj toString]];
    }
    if (_mobileNumberObj) {
        [payload appendString: [_mobileNumberObj toString]];
    }
    if (_storeLabelObj) {
        [payload appendString: [_storeLabelObj toString]];
    }
    if (_terminalLabelObj) {
        [payload appendString: [_terminalLabelObj toString]];
    }
    if (_purposeOfTransactionObj) {
        [payload appendString: [_purposeOfTransactionObj toString]];
    }
    return payload;
}

- (NSString *)toString {
    if (IsEmpty(_billNumberObj) &&
        IsEmpty(_mobileNumberObj) &&
        IsEmpty(_storeLabelObj) &&
        IsEmpty(_terminalLabelObj) &&
        IsEmpty(_purposeOfTransactionObj)) {
        return @"";
    }
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
