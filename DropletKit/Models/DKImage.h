//
//  DKImage.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@class DKRegion, PMKPromise;

@interface DKImage : DKBaseModel

#pragma mark Common properties
@property NSString *name;
@property NSString *distribution;
@property NSString *slug;
@property NSArray *regions;
@property NSString *type;

#pragma mark Renamed properties
@property NSNumber *imageId;
@property BOOL isPublic;
@property NSNumber *minDiskSize;

#pragma mark Extended properties
@property NSDate *createdAt;

#pragma mark Related collections
- (PMKPromise *)getActions;

#pragma mark Object actions
- (PMKPromise *)renameImageTo:(NSString *)imageName;
- (PMKPromise *)destroy;
- (PMKPromise *)transferToRegion:(DKRegion *)region;
- (PMKPromise *)convertToSnapshot;
- (PMKPromise *)getActionById:(NSNumber *)actionId;

@end
