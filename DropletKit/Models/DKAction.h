//
//  DKAction.h
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@interface DKAction : DKBaseModel

#pragma mark Common properties
@property NSString *status;
@property NSString *type;
@property NSString *region;

#pragma mark Renamed properties
@property NSNumber *actionId;
@property NSNumber *resourceId;
@property NSString *resourceType;
@property NSString *regionSlug;

#pragma mark Extended properties
@property NSDate *startedAt;
@property NSDate *completedAt;

@end
