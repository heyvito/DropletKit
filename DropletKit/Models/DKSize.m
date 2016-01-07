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
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if(CHECK_DATA_CONTAINS(slug, memory, vcpus, disk, transfer, price_monthly, price_hourly, regions)) {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, slug, memory, disk, transfer, regions);
        EXPAND_DATA_LOCAL(vcpus, vCPUs)
        EXPAND_DATA_LOCAL(price_monthly, priceMonthly)
        EXPAND_DATA_LOCAL(price_hourly, priceHourly)
        EXPAND_DICT_LOCAL_BOOL(data, available, available)
        self.available = [data[@"available"] boolValue];
    }
}

@end
