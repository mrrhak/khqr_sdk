//
//  FormatIndicator.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface FormatIndicator : NSObject<TagLengthStringProtocol>

-(id)initWithVersion :(NSString *)version;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

