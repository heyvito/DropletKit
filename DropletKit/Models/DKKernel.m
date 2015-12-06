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
- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(data == nil || [data isEqual:[NSNull null]]) {
        self = nil;
    } else {
        if([[data allKeys] containsObject:@"kernel"]) {
            data = [data objectForKey:@"kernel"];
        }
        if(!CHECK_DATA_CONTAINS(kernel_id, name, version)) {
            self = nil;
        } else {
            CALL_MACRO_X_FOR_EACH(EXPAND_DATA, name, version)
            EXPAND_DATA_LOCAL(id, kernelId)
        }
    }
    return self;
}
@end
