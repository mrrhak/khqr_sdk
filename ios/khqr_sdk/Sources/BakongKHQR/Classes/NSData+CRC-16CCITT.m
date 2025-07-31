//
//  NSData+CRC-16CCITT.m
//  BakongKHQR
//
//  Created by Seth Sambo on 12/8/20.
//

#import "NSData+CRC-16CCITT.h"

@implementation NSData (NSData_CRC_16CCITT)

#define POLY 0x1021
uint16_t crc16(const uint8_t *data_p, unsigned length)
{
    unsigned char i;
    uint8_t data;
    unsigned int crc = 0xFFFF;
    
    while (length-- > 0)
    {
        for (i = 0, data = *data_p++;
             i < 8;
             i++, data <<= 1)
        {
            if ((crc >> 15) ^ (data >> 7))
                crc = (crc << 1) ^ POLY;
            else
                crc <<= 1;
            
            crc &= 0xffff;
        }
    }
    return crc;
}

- (unsigned short)crc16Checksum
{
    const uint8_t *bytes = (const uint8_t *)[self bytes];
    uint16_t length = (uint16_t)[self length];
    return (unsigned short)crc16(bytes, length);
}

@end
