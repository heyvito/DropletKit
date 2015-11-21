//
//  DKRegion.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@interface DKRegion : DKBaseModel

#pragma mark Common properties
@property NSString *name;
@property NSString *slug;
@property NSArray *sizes;
@property NSArray *features;
@property BOOL available;

@end
