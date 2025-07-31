//
//  KHQRDeepLinkData.m
//  BakongKHQR
//
//  Created by Seth Sambo on 5/3/21.
//

#import "KHQRDeepLinkData.h"

@implementation KHQRDeepLinkData

-(id)initWithShortLink: (NSString *)link{
    self = [super init];
    if (self) {
        _shortLink = link;
    }
    return self;
}

@end
