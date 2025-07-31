//
//  KeyTagProtocol.h
//  BakongKHQR
//
//  Created by Seth Sambo on 12/14/20.
//

@protocol TagLengthStringProtocol <NSObject>

@required
@property (nonatomic, strong) NSString* tag;
@property (nonatomic, strong) NSString* value;

-(NSString *) toString;

//@optional
@end
