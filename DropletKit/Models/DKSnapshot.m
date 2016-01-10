//
//  DKSnapshot.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKSnapshot.h"
#import "DropletKit.h"

@implementation DKSnapshot

#pragma mark Life cycle
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if(CHECK_DATA_CONTAINS(id, name, distribution, slug, public, regions, created_at, type, min_disk_size)) {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, name, distribution, slug, regions, type)
        EXPAND_DATA_LOCAL(id, snapshotId)
        EXPAND_DICT_LOCAL_BOOL(data, public, isPublic)
        EXPAND_DATA_LOCAL(min_disk_size, minDiskSize)
        EXPAND_DATA_DATE_LOCAL(created_at, createdAt)
    }
}

- (NSNumber *)restorableId {
    return self.snapshotId;
}

- (NSString *)restorableSlug {
    return self.slug;
}
@end
