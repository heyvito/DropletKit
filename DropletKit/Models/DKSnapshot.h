//
//  DKSnapshot.h
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@interface DKSnapshot : DKBaseModel

#pragma mark Common properties
@property NSString *name;
@property NSString *distribution;
@property NSString *slug;
@property NSArray *regions;
@property NSString *type;

#pragma mark Renamed properties
@property NSNumber *snapshotId;
@property BOOL isPublic;
@property NSNumber *minDiskSize;

#pragma mark Extended properties
@property NSDate *createdAt;

@end
