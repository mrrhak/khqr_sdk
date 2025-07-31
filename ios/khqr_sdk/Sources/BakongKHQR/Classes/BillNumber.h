//
//  BillNumber.h
//  BakongKHQR
//
//  Created by Seth Sambo on 2/6/21.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface BillNumber : NSObject<TagLengthStringProtocol>

-(id)initWithBillNumber :(NSString *)billNumber;
-(NSString *) decodeWithQr: (NSString *)qr;

@end
