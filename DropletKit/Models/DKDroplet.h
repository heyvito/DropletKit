//
//  DKDroplet.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@class DKKernel, DKImage, DKSize, DKRegion, DKBackupWindow, DKNetworkCollection, PMKPromise;

@interface DKDroplet : DKBaseModel

#pragma mark Common properties

/**
 *  The human-readable name set for the Droplet instance.
 */
@property NSString *name;

/**
 *  Memory of the Droplet in megabytes.
 */
@property NSNumber *memory;

/**
 *  The size of the Droplet's disk in gigabytes.
 */
@property NSNumber *disk;

/**
 *  A boolean value indicating whether the Droplet has been locked,
 *  preventing actions by users.
 */
@property BOOL locked;

/**
 *  A status string indicating the state of the Droplet instance. 
 *  This may be "new", "active", "off", or "archive".
 */
@property NSString *status;

/**
 *  An array of features enabled on this Droplet.
 */
@property NSArray *features;

#pragma mark Renamed Properties

/**
 *  A unique identifier for each Droplet instance. This is automatically generated upon Droplet creation.
 */
@property NSNumber *dropletId;

/**
 *  The number of virtual CPUs.
 */
@property NSNumber *vCPUs;

/**
 *  The unique slug identifier for the size of this Droplet.
 */
@property NSString *sizeSlug;

/**
 *  An array of snapshot IDs of any snapshots created from the Droplet instance.
 */
@property NSArray *snapshotIds;

/**
 *  An array of backup IDs of any backups that have been taken of the Droplet instance.
 *  Droplet backups are enabled at the time of the instance creation.
 */
@property NSArray *backupIds;

#pragma mark Extended Properties

/**
 *  A date and time that represents when the Droplet was created.
 */
@property NSDate *createdAt;

/**
 *  The current kernel. This will initially be set to the kernel of
 *  the base image when the Droplet is created.
 */
@property DKKernel *kernel;

/**
 *  The base image used to create the Droplet instance.
 */
@property DKImage *image;

/**
 *  The current size object describing the Droplet. Note that the
 *  disk volume of a droplet may not match the size's disk due to Droplet
 *  resize actions. The disk attribute on the Droplet should always be referenced.
 */
@property DKSize *size;

/**
 *  The region that the Droplet instance is deployed in.
 */
@property DKRegion *region;

/**
 *  The details of the network that are configured for the Droplet
 *  instance. This is an object that describes IPv4 and IPv6 networks.
 */
@property DKNetworkCollection *networks;

/**
 *  Whether this droplet has a backup window coming up.
 */
@property BOOL hasNextBackupWindow;

/**
 *  The details of the Droplet's backups feature,
 *  if backups are configured for the Droplet.
 */
@property DKBackupWindow *nextBackupWindow;

#pragma mark Related collections

/**
 *  Gets a list of available kernels for this Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKKernelCollection *`
 */
- (PMKPromise *)getAvailableKernels;

/**
 *  Gets a list of snapshots for this Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKSnapshotCollection *`
 */
- (PMKPromise *)getSnapshots;

/**
 *  Gets a list of backups for this Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKBackupCollection *`
 */
- (PMKPromise *)getBackups;

/**
 *  Gets a list of actions performed on this Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKActionCollection *`
 */
- (PMKPromise *)getActions;

/**
 *  Gets a list of neighbor droplets for this Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDropletCollection *`
 */
- (PMKPromise *)getNeighbors;

#pragma mark Object actions
/**
 *  Deletes this droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `id`, and will be `[NSNull null]`,
 *           even if the operation succeeds.
 */
- (PMKPromise *)destroy;

/**
 *  Disables backups on this Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)disableBackups;

/**
 *  Reboots this Droplet. This operation has the same effect as issuing a
 *  `reboot` command directly from the console.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)reboot;

/**
 *  Powercycles this Droplet. This operation has the same effect as pressing
 *  the physical reset button of the machine, forcing it to boot up from
 *  scratch.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)powerCycle;

/**
 *  Shuts down this Droplet. This operation has the same effect as issuing a
 *  `poweroff` command from the console. Please notice that this triggers the
 *  command, but does not guarantee that the machine is turned off.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)shutdown;

/**
 *  Powers off the Droplet. This operation has the same effect as cutting the
 *  power of a server and may lead to complications.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)powerOff;

/**
 *  Powers on the Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)powerOn;

/**
 *  Restores this Droplet to a previous state by using an DKImage object
 *
 *  @param image DKImage object referencing an image or snapshot to restore
 *               this Droplet to.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)restoreWithImage:(DKImage *)image;

/**
 *  Restores this Droplet to a previous state by using an Image id
 *
 *  @param imageId Image ID to restore this Droplet to.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)restoreWithImageId:(NSNumber *)imageId;

/**
 *  Restores this Droplet to a previous state by using an Image slug
 *
 *  @param imageSlug Image slug to restore this Droplet to
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)restoreWithImageSlug:(NSString *)imageSlug;

/**
 *  Resets the password for this Droplet. This will send an Email to the droplet's
 *  administrator with the new password.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)resetPassword;

/**
 *  Resizes this Droplet to a given DKSize
 *
 *  @param size        DKSize to resize this Droplet to
 *  @param resizeDisks Whether to increase disk size
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)resizeWithSize:(DKSize *)size andResizeDisks:(BOOL)resizeDisks;

/**
 *  Rebuilds this Droplet using a given DKImage
 *
 *  @param image DKImage that will be used to rebuild this Droplet
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)rebuildWithImage:(DKImage *)image;

/**
 *  Rebuilds this Droplet using a given Image ID
 *
 *  @param imageId Image ID that will be used to rebuild this Droplet
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)rebuildWithImageId:(NSNumber *)imageId;

/**
 *  Rebuilds this Droplet using a given Image Slug
 *
 *  @param imageSlug Image Slug that will be used to rebuild this Droplet
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)rebuildWithImageSlug:(NSString *)imageSlug;


/**
 *  Renames this Droplet
 *
 *  @param name New name of this Droplet
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)renameTo:(NSString *)name;

/**
 *  Changes this Droplet's Kernel to a given DKKernel
 *
 *  @param kernel Kernel to be used
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)changeKernelTo:(DKKernel *)kernel;

/**
 *  Enables IPv6 support on this droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)enableIPv6;

/**
 *  Enables private networking capability on this Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)enablePrivateNetworking;

/**
 *  Creates a snapshot of this Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)createSnapshot;

/**
 *  Upgrades this Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)upgrade;

/**
 *  Gets an action by its ID
 *
 *  @param actionId ID of the action to be get
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)getAction:(NSNumber *)actionId;

@end
