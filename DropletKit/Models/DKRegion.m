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
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if(CHECK_DATA_CONTAINS(name, slug, sizes, features, available)) {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, name, slug, sizes, features)
        self.available = [data[@"available"] boolValue];
    }
}
@end
