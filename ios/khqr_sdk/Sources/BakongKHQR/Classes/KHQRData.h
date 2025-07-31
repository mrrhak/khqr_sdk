//
//  KHQRData.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/21/20.
//

#import <Foundation/Foundation.h>
#import "ResponseProtocol.h"

@interface KHQRData : NSObject<ResponseProtocol>

-(id)initWithQR: (NSString *)qr;

@property (strong, nonatomic) NSString * qr;
@property (strong, nonatomic) NSString* md5;

@end
