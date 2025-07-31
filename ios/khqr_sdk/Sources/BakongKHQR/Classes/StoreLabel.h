//
//  StoreLabel.h
//  BakongKHQR
//
//  Created by Seth Sambo on 2/6/21.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface StoreLabel : NSObject<TagLengthStringProtocol>

-(id)initWithStoreLabel :(NSString *)storeLabel;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

