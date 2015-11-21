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
@property NSString *name;
@property NSNumber *memory;
@property NSNumber *disk;
@property BOOL locked;
@property NSString *status;
@property NSArray *features;

#pragma mark Renamed Properties
@property NSNumber *dropletId;
@property NSNumber *vCPUs;
@property NSString *sizeSlug;
@property NSArray *snapshotIds;
@property NSArray *backupIds;

#pragma mark Extended Properties
@property NSDate *createdAt;
@property DKKernel *kernel;
@property DKImage *image;
@property DKSize *size;
@property DKRegion *region;
@property DKNetworkCollection *networks;
@property BOOL hasNextBackupWindow;
@property DKBackupWindow *nextBackupWindow;

#pragma mark Related collections
- (PMKPromise *)getAvailableKernels;
- (PMKPromise *)getSnapshots;
- (PMKPromise *)getBackups;
- (PMKPromise *)getActions;
- (PMKPromise *)getNeighbors;

#pragma mark Object actions
- (PMKPromise *)destroy;
- (PMKPromise *)disableBackups;
- (PMKPromise *)reboot;
- (PMKPromise *)powerCycle;
- (PMKPromise *)shutdown;
- (PMKPromise *)powerOff;
- (PMKPromise *)powerOn;

- (PMKPromise *)restoreWithImage:(DKImage *)image;
- (PMKPromise *)restoreWithImageId:(NSNumber *)imageId;
- (PMKPromise *)restoreWithImageSlug:(NSString *)imageSlug;

- (PMKPromise *)resetPassword;
- (PMKPromise *)resizeWithSize:(DKSize *)size andResizeDisks:(BOOL)resizeDisks;

- (PMKPromise *)rebuildWithImage:(DKImage *)image;
- (PMKPromise *)rebuildWithImageId:(NSNumber *)imageId;
- (PMKPromise *)rebuildWithImageSlug:(NSString *)imageSlug;

- (PMKPromise *)renameTo:(NSString *)name;
- (PMKPromise *)changeKernelTo:(DKKernel *)kernel;
- (PMKPromise *)enableIPv6;
- (PMKPromise *)enablePrivateNetworking;
- (PMKPromise *)createSnapshot;
- (PMKPromise *)upgrade;
- (PMKPromise *)getAction:(NSNumber *)actionId;

@end
