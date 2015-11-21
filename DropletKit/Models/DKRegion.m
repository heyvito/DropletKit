//
//  DKRegion.m
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKRegion.h"
#import "DropletKit.h"

@implementation DKRegion

#pragma mark Life cycle
- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(!CHECK_DATA_CONTAINS(name, slug, sizes, features, available)) {
        self = nil;
    } else {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, name, slug, sizes, features)
        self.available = [data[@"available"] boolValue];
    }
    return self;
}
@end
