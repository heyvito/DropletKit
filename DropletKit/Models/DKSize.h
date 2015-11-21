//
//  DKSize.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@interface DKSize : DKBaseModel

#pragma mark Common properties
@property NSString *slug;
@property NSNumber *memory;
@property NSNumber *disk;
@property NSNumber *transfer;
@property NSArray *regions;
@property BOOL available;

#pragma mark Renamed properties
@property NSNumber *vCPUs;
@property NSNumber *priceMonthly;
@property NSNumber *priceHourly;

@end
