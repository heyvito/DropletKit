//
//  DKKernel.m
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKKernel.h"
#import "DropletKit.h"

@implementation DKKernel

#pragma mark Life cycle
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if([data isKindOfClass:[NSDictionary class]]) {
        if([[data allKeys] containsObject:@"kernel"]) {
            data = [data objectForKey:@"kernel"];
        }
        if(CHECK_DATA_CONTAINS(kernel_id, name, version)) {
            CALL_MACRO_X_FOR_EACH(EXPAND_DATA, name, version)
            EXPAND_DATA_LOCAL(id, kernelId)
        }
    }
}
@end
