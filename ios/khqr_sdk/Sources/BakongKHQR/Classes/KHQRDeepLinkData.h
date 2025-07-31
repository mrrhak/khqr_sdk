//
//  KHQRDeepLinkData.h
//  BakongKHQR
//
//  Created by Seth Sambo on 5/3/21.
//

#import <Foundation/Foundation.h>
#import "ResponseProtocol.h"

@interface KHQRDeepLinkData : NSObject<ResponseProtocol>

-(id)initWithShortLink: (NSString *)link;
@property (strong, nonatomic) NSString * shortLink;

@end

