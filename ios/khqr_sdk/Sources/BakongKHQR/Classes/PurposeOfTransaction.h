//
//  PurposeOfTransaction.h
//  BakongKHQR
//
//  Created by Seth Sambo on 23/6/23.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface PurposeOfTransaction : NSObject<TagLengthStringProtocol>

-(id)initWithPurpose :(NSString *)purpose;
-(NSString *) decodeWithQr: (NSString *)qr;

@end
