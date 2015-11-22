//
//  DKSnapshot.h
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"


/**
 *  A snapshot holds the state of a given Droplet in a given
 *  point of time. This snapshot can be used to base new Droplets
 *  or restore them to this previous state.
 */
@interface DKSnapshot : DKBaseModel

#pragma mark Common properties

/**
 *  The display name of the image. This is shown in the web UI and is generally 
 *  a descriptive title for the image in question.
 */
@property NSString *name;

/**
 *  The base distribution used for this image.
 */
@property NSString *distribution;

/**
 *  A uniquely identifying string that is associated with each of the DigitalOcean-provided public images.
 *  These can be used to reference a public image as an alternative to the numeric id.
 */
@property NSString *slug;

/**
 *  An array of the regions that the image is available in. 
 *  The regions are represented by their identifying slug values.
 */
@property NSArray *regions;

/**
 *  The kind of image, describing the duration of how long the image is stored.
 *  This is either "snapshot" or "backup".
 */
@property NSString *type;

#pragma mark Renamed properties

/**
 *  A unique number used to identify and reference a specific image.
 */
@property NSNumber *snapshotId;

/**
 *  A boolean value that indicates whether the image in question is public. 
 *  An image that is public is available to all accounts. A non-public image is 
 *  only accessible from your account.
 */
@property BOOL isPublic;

/**
 *  The minimum 'disk' required for a size to use this image.
 */
@property NSNumber *minDiskSize;

#pragma mark Extended properties

/**
 *  A date and time that represents when the Image was created.
 */
@property NSDate *createdAt;

@end
