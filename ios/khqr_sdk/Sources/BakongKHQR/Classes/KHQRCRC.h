//
//  CRC.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/15/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface KHQRCRC : NSObject<TagLengthStringProtocol>

-(id)initWithPayloadString :(NSString *)payload;
-(void)setQRString: (NSString *)payload;
-(NSString *) decodeWithQr: (NSString *)qr;

@end

