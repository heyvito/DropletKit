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

/**
 *  The display name that has been given to an image. 
 *  This is what is shown in the control panel and is generally a descriptive
 *  title for the image in question.
 */
@property NSString *name;

/**
 *  This attribute describes the base distribution used for this image.
 */
@property NSString *distribution;

/**
 *  A uniquely identifying string that is associated with each of the
 *  DigitalOcean-provided public images. These can be used to reference a public
 *  image as an alternative to the numeric id.
 */
@property NSString *slug;

/**
 *  This attribute is an array of the regions that the image is available in.
 *  The regions are represented by their identifying slug values. (NSArray<NSString *>*)
 */
@property NSArray *regions;

/**
 *  The kind of image, describing the duration of how long the image is stored. 
 *  This is either "snapshot" or "backup".
 */
@property NSString *type;

#pragma mark Renamed properties

/**
 *  A unique number that can be used to identify and reference a specific image.
 */
@property NSNumber *imageId;

/**
 *  This is a boolean value that indicates whether the image in question is public or not.
 *  An image that is public is available to all accounts. A non-public image is only accessible
 *  from your account.
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

#pragma mark Related collections

/**
 *  Gets a list of actions performed on this image
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKActionCollection *`
 */
- (PMKPromise *)getActions;

#pragma mark Object actions

/**
 *  Renames this image to the given name
 *
 *  @param imageName How the image should be called
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKImage *`
 */
- (PMKPromise *)renameImageTo:(NSString *)imageName;

/**
 *  Deletes this image.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `id`, and will be `[NSNull null]`,
 *           even if the operation succeeds.
 */
- (PMKPromise *)destroy;

/**
 *  Transfers this image to a new region.
 *
 *  @param region Region to where this image will be moved to.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)transferToRegion:(DKRegion *)region;

/**
 *  Converts this image to a snapshot
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)convertToSnapshot;

/**
 *  Gets an action by its ID
 *
 *  @param actionId ID of the action to be get
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)getActionById:(NSNumber *)actionId;

@end
