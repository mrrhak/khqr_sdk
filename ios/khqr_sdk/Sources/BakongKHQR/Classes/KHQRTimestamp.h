//
//  KHQRTimestamp.h
//  BakongKHQR
//
//  Created by Sang Chantha on 27/9/24.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface KHQRTimestamp : NSObject<TagLengthStringProtocol>

-(id)initWithTimestamp :(long long)timestamp
                        tag: (NSString *)tag;
-(id)initWithTag : (NSString *) tag;
-(NSString *) decodeWithQr: (NSString *)qr;

@end
