//
//  DKSize.m
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKSize.h"
#import "DropletKit.h"

@implementation DKSize

#pragma mark Life cycle
- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(!CHECK_DATA_CONTAINS(slug, memory, vcpus, disk, transfer, price_monthly, price_hourly, regions)) {
        self = nil;
    } else {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, slug, memory, disk, transfer, regions, available);
        EXPAND_DATA_LOCAL(vcpus, vCPUs)
        EXPAND_DATA_LOCAL(price_monthly, priceMonthly)
        EXPAND_DATA_LOCAL(price_hourly, priceHourly)
        self.available = [data[@"available"] boolValue];
    }
    return self;
}

@end
