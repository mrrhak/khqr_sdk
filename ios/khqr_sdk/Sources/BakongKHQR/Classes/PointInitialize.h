//
//  PointInitialize.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface PointInitialize : NSObject<TagLengthStringProtocol>

-(id)initWithQrType :(NSString *)qrType;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

