//
//  DKAction.m
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKAction.h"
#import "DropletKit.h"

@implementation DKAction

#pragma mark Life cycle
- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if([[data allKeys] containsObject:@"action"]) {
        data = [data objectForKey:@"action"];
    }
    if(!CHECK_DATA_CONTAINS(id, status, type, started_at, completed_at, resource_id, resource_type, region, region_slug)) {
        self = nil;
    } else {
        // Common Items
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, status, type, region)
        // Renamed items
        EXPAND_DATA_LOCAL(id, actionId);
        EXPAND_DATA_LOCAL(resource_id, resourceId)
        EXPAND_DATA_LOCAL(resource_type, resourceType)
        EXPAND_DATA_LOCAL(region_slug, regionSlug)
        // NSDate items
        EXPAND_DATA_DATE_LOCAL(started_at, startedAt);
        EXPAND_DATA_DATE_LOCAL(completed_at, completedAt);
    }
    return self;
}

@end
