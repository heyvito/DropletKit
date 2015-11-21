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

/**
 *  The display name of the region. This will be a full name that is
 *  used in the control panel and other interfaces.
 */
@property NSString *name;

/**
 *  A human-readable string that is used as a unique identifier
 *  for each region.
 */
@property NSString *slug;

/**
 *  This attribute is set to an array which contains the identifying slugs
 *  for the sizes available in this region.
 */
@property NSArray *sizes;

/**
 *  This attribute is set to an array which contains features
 * available in this region.
 */
@property NSArray *features;

/**
 *  This is a boolean value that represents whether new Droplets can be
 * created in this region.
 */
@property BOOL available;

@end
