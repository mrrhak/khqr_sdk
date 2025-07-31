//
//  KHQRDataDictionary.m
//  BakongKHQR
//
//  Created by Seth Sambo on 4/6/24.
//

#import "KHQREMVQRData.h"

@interface KHQREMVQRData()

@property (strong, nonatomic) NSMutableDictionary * backingStore;

@end


@implementation KHQREMVQRData
@synthesize backingStore;

- (instancetype)init {
    self = [super init];
    if (self) {
        backingStore = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)getValueByKey:(NSString *)key {
    id value = [backingStore objectForKey:key];
    if (value == nil) {
        return [NSNull null];
    }
    return value;
}


// Overriding methods to make NSMutableDictionary abstract methods concrete
- (NSUInteger)count {
    return [backingStore count];
}

- (NSEnumerator *)keyEnumerator {
    return [backingStore keyEnumerator];
}

- (id)objectForKey:(id)aKey {
    return [backingStore objectForKey:aKey];
}

- (void)removeObjectForKey:(id)aKey {
    [backingStore removeObjectForKey:aKey];
}

- (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey {
    [backingStore setObject:anObject forKey:aKey];
}

@end
