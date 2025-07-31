//
//  TerminalLabel.m
//  BakongKHQR
//
//  Created by Seth Sambo on 2/6/21.
//

#import "TerminalLabel.h"
#import "KHQRMerchantPresentedCodes.h"
#import "Constants.h"

@interface TerminalLabel()

@property (strong, nonatomic) NSString * terminalLabel;

@end

@implementation TerminalLabel

@synthesize tag;
@synthesize value;

#pragma mark - Init
-(id)initWithTerminalLabel :(NSString *)terminalLabel {
    self = [super init];
    if (self) {
        [self checkException: terminalLabel];
        _terminalLabel = terminalLabel;
    }
    return self;
}

#pragma mark - Decode
-(NSString *) decodeWithQr: (NSString *)qr {
    NSString * tagFromQR =[Constants subString: qr toIndex: 2];
    NSString * remaningQR = @"";
    
    if ([tagFromQR isEqualToString: self.tag]) {
        remaningQR =[Constants replaceString: qr withEmptyStringToIndex: 2];
        
        NSInteger valueLength = [Constants subString: remaningQR toIndex: 2].intValue;
        remaningQR =  [Constants replaceString: remaningQR withEmptyStringToIndex: 2];
        
        _terminalLabel = [Constants subString: remaningQR toIndex: valueLength];
        [self checkException: _terminalLabel];
        
        remaningQR = [Constants replaceString: remaningQR withEmptyStringToIndex: valueLength];
        return remaningQR;
    }
    return qr;
}

#pragma mark - Helper functions
-(void) checkException: (NSString *) cTerminalLabel {
    // no throw exception when decoding
    if (Constants.shared.isDecoding) {
        return;
    }
    BOOL checkLength __unused = [Constants checkLengthException: cTerminalLabel
                                                         reason: terminalLabelLengthInvalid];
}

#pragma mark - Protocol
-(NSString *) tag {
    return TERMINAL_LABEL;
}

-(NSString *) value {
    return _terminalLabel;
}

- (NSString *)toString {
    NSString * lengthString = [NSString stringWithFormat:@"%02ld", self.value.length];
    NSString* toStringValue = [NSString stringWithFormat: @"%@%@%@",
                               self.tag, lengthString, self.value];
    return toStringValue;
}

@end
