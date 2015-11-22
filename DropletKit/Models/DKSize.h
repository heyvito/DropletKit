//
//  DKSize.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"


/**
 *  The sizes objects represent different packages of hardware
 *  resources that can be used for Droplets. When a Droplet is
 *  created, a size must be selected so that the correct resources
 *  can be allocated.
 *
 *  Each size represents a plan that bundles together specific sets
 *  of resources. This includes the amount of RAM, the number of virtual
 *  CPUs, disk space, and transfer. The size object also includes the
 *  pricing details and the regions that the size is available in.
 */
@interface DKSize : DKBaseModel

#pragma mark Common properties

/**
 *  A human-readable string that is used to uniquely identify each size.
 */
@property NSString *slug;

/**
 *  The amount of RAM allocated to Droplets created of this size.
 *  The value is represented in megabytes.
 */
@property NSNumber *memory;

/**
 *  The amount of disk space set aside for Droplets of this size.
 *  The value is represented in gigabytes.
 */
@property NSNumber *disk;

/**
 *  The amount of transfer bandwidth that is available for Droplets created in this size. 
 *  This only counts traffic on the public interface. The value is given in terabytes.
 */
@property NSNumber *transfer;

/**
 *  An array containing the region slugs where this size is available for Droplet creates.
 */
@property NSArray *regions;

/**
 *  This is a boolean value that represents whether new Droplets can be created with this size.
 */
@property BOOL available;

#pragma mark Renamed properties

/**
 *  The number of virtual CPUs allocated to Droplets of this size.
 */
@property NSNumber *vCPUs;

/**
 *  This attribute describes the monthly cost of this Droplet size if the Droplet is 
 *  kept for an entire month. The value is measured in US dollars.
 */
@property NSNumber *priceMonthly;

/**
 *  This describes the price of the Droplet size as measured hourly. 
 *  The value is measured in US dollars.
 */
@property NSNumber *priceHourly;

@end
