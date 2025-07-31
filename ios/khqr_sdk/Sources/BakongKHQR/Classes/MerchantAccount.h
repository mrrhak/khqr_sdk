//
//  MerchantAccount.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "Enums.h"

@interface MerchantAccount : NSObject  <TagLengthStringProtocol>

-(id _Null_unspecified)initWithAccountId  : (NSString * _Nonnull)accountId
                         accountInformation: (NSString * _Nullable)accountInfo
                             acquiringBank: (NSString * _Nullable)acquiringBank;

-(id _Null_unspecified)initWithAccountId  : (NSString * _Nonnull)accountId
                                merchantId: (NSString * _Nonnull)merchantId
                             acquiringBank: (NSString * _Nonnull)acquiringBank;

-(NSString * _Nonnull) decodeWithQr: (NSString * _Nonnull)qr;
-(QRType) getType;
-(NSString * _Nonnull) getAccountId;
-(NSString * _Nonnull) getAccountInformation;
-(NSString * _Nonnull) getMerchantId;
-(NSString * _Nonnull) getAcquiringBank;
@end

