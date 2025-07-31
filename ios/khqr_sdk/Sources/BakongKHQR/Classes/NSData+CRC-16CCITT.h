//
//  NSData+CRC-16CCITT.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/8/20.
//

#import <Foundation/Foundation.h>

@interface NSData (NSData_CRC_16CCITT)

- (unsigned short)crc16Checksum;

@end
