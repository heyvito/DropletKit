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
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if([[data allKeys] containsObject:@"action"]) {
        data = [data objectForKey:@"action"];
    }
    if(CHECK_DATA_CONTAINS(id, status, type, started_at, completed_at, resource_id, resource_type, region_slug)) {
        // Common Items
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, status, type)
        // Renamed items
        EXPAND_DATA_LOCAL(id, actionId);
        EXPAND_DATA_LOCAL(resource_id, resourceId)
        EXPAND_DATA_LOCAL(resource_type, resourceType)
        EXPAND_DATA_LOCAL(region_slug, regionSlug)
        // NSDate items
        EXPAND_DATA_DATE_LOCAL(started_at, startedAt);
        if([[data allKeys] containsObject:@"completed_at"] && ![data[@"completed_at"] isEqual:[NSNull null]]) {
            self.completed = YES;
            EXPAND_DATA_DATE_LOCAL(completed_at, completedAt);
        } else {
            self.completed = NO;
        }
    }
}

- (void)reloadWithBlock:(void (^)(BOOL))block {
    [[DKClient sharedInstance] getActionWithId:self.actionId].then(^(DKAction *action) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        [self fillInstanceWithDictionary:[action performSelector:@selector(getInitialDictionary) withObject:nil]];
#pragma clang pop
        block(YES);
    }).catch(^{
        block(NO);
    });
}

@end
