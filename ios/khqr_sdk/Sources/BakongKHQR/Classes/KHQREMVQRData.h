//
//  KHQRDataDictionary.h
//  BakongKHQR
//
//  Created by Seth Sambo on 4/6/24.
//

#import <Foundation/Foundation.h>
#import "ResponseProtocol.h"

@interface KHQREMVQRData : NSMutableDictionary<ResponseProtocol>

- (id)getValueByKey:(NSString *)key;

@end
