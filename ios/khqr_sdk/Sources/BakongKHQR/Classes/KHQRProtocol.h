//
//  KHQRProtocol.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/9/20.
//

#import <Foundation/Foundation.h>
#import "KHQRResponse.h"
#import "SourceInfo.h"
#import "IndividualInfo.h"
#import "MerchantInfo.h"

@protocol KHQRProtocol <NSObject>

@required
+(KHQRResponse *)verify: (NSString *)khqrCode;
+(KHQRResponse *)decode: (NSString *)qr;
+(KHQRResponse *)decodeNonKhqr: (NSString *)qr;
+(KHQRResponse *)generateDeepLink:(NSString *)url
                               qr: (NSString *)qr
                       sourceInfo:(SourceInfo * _Nullable)sourceInfo;
+(KHQRResponse * _Nonnull)generateIndividual: (IndividualInfo * _Nonnull)info;
+(KHQRResponse * _Nonnull)generateMerchant: (MerchantInfo * _Nonnull)info;
@end
