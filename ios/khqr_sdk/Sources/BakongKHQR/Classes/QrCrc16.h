//
//  QrCrc16.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/9/20.
//

#import <Foundation/Foundation.h>

@interface QrCrc16 : NSObject

// qr code withuot crc
@property (nonatomic, strong) NSString* qrCode;

// 4 digits crc code that extract from qrcode
@property (nonatomic, strong) NSString* crcCode;

-(id)initWithCode:(NSString *)qrCode crcCode:(NSString *)crcCode;
-(BOOL)isMatchCRC: (NSString *)crcCode;

@end

