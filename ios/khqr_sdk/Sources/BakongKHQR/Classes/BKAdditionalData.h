//
//  AdditionalData.h
//  BakongKHQR
//
//  Created by Seth Sambo on 2/6/21.
//

#import <Foundation/Foundation.h>
#import "TagLengthStringProtocol.h"
#import "BillNumber.h"
#import "MobileNumber.h"
#import "StoreLabel.h"
#import "TerminalLabel.h"
#import "PurposeOfTransaction.h"

@interface BKAdditionalData : NSObject<TagLengthStringProtocol>

-(id)initWithBillNumber :(NSString *)billNumber storeLabel: (NSString *)storeLabel terminalLabel: (NSString *) terminalLabel purposeOfTransaction: (NSString *) purposeOfTransaction;
-(NSString *) decodeWithQr: (NSString *)qr;

-(void)setBillNumber: (NSString *)billNumber;
-(void)setMobileNumber: (NSString *)mobileNumber;
-(void)setStoreLabel: (NSString *)storeLabel;
-(void)setTerminalLabel: (NSString *)terminalLabel;
-(void)setPurposeOfTransaction: (NSString *)purposeOfTransaction;

-(NSString *) getBillNumber;
-(NSString *) getMobileNumber;
-(NSString *) getStoreLabel;
-(NSString *) getTerminalLabel;
-(NSString *) getPurposeOfTransaction;

-(BOOL)IsEmpty;

@end

