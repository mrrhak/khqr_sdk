//
//  SourceInfo.m
//  BakongKHQR
//
//  Created by Seth Sambo on 2/24/21.
//

#import "SourceInfo.h"

@interface SourceInfo()

@end

@implementation SourceInfo

-(SourceInfo * _Nullable)initWithAppIconURL  :(NSString * _Nonnull)iconUrl
                       appName:(NSString * _Nonnull)appName
                       appDeepLinkCallBack: (NSString * _Nonnull)callback {
    self = [super init];
    if (self) {
        _appIconURL = iconUrl;
        _appName = appName;
        _appDeepLinkCallback = callback;
    }
    return self;
}

-(BOOL)IsEmpty {
    if (_appIconURL || _appName || _appDeepLinkCallback) {
        return FALSE;
    }
    return TRUE;
}

@end
