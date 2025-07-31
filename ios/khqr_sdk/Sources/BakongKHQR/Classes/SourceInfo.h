//
//  SourceInfo.h
//  BakongKHQR
//
//  Created by Seth Sambo on 2/24/21.
//

#import <Foundation/Foundation.h>

@interface SourceInfo : NSObject

-(SourceInfo * _Nullable)initWithAppIconURL  :(NSString * _Nonnull)appIconURL
                       appName:(NSString * _Nonnull)appName
           appDeepLinkCallBack: (NSString * _Nonnull)callback;

-(BOOL)IsEmpty;

@property (nonatomic, strong) NSString * _Nonnull appIconURL;
@property (nonatomic, strong) NSString * _Nonnull appName;
@property (nonatomic, strong) NSString * _Nonnull appDeepLinkCallback;

@end
