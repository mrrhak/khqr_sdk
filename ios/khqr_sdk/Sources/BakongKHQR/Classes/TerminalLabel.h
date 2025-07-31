//
//  TerminalLabel.h
//  BakongKHQR
//
//  Created by Seth Sambo on 2/6/21.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"

@interface TerminalLabel : NSObject<TagLengthStringProtocol>

-(id)initWithTerminalLabel :(NSString *)terminalLabel;
-(NSString *) decodeWithQr: (NSString *)qr;

@end
