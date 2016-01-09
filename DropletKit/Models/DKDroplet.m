//
//  DKDroplet.m
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKDroplet.h"
#import "DropletKit.h"

@implementation DKDroplet

#pragma mark Life cycle
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if([[data allKeys] containsObject:@"droplet"]) {
        data = data[@"droplet"];
    }
    if(CHECK_DATA_CONTAINS(id, name, memory, vcpus, disk, locked, status, kernel, created_at, features, backup_ids, snapshot_ids, image, size, size_slug, networks, region)) {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, name, memory, disk, status, features)
        EXPAND_DATA_LOCAL(id, dropletId)
        EXPAND_DATA_LOCAL(vcpus, vCPUs)
        EXPAND_DATA_LOCAL(size_slug, sizeSlug)
        EXPAND_DATA_LOCAL(snapshot_ids, snapshotIds)
        EXPAND_DATA_LOCAL(backup_ids, backupIds)
        EXPAND_DATA_DATE_LOCAL(created_at, createdAt)
        
        self.locked = [[data objectForKey:@"locked"] boolValue];
        self.kernel = [[DKKernel alloc] initWithDictionary:data[@"kernel"]];
        self.isKernelManagedInternally = self.kernel == nil;
        self.image = [[DKImage alloc] initWithDictionary:data[@"image"]];
        self.size = [[DKSize alloc] initWithDictionary:data[@"size"]];
        self.region = [[DKRegion alloc] initWithDictionary:data[@"region"]];
        self.networks = [[DKNetworkCollection alloc] initWithDictionary:data[@"networks"]];
        self.nextBackupWindow = [[DKBackupWindow alloc] initWithDictionary:data[@"next_backup_window"]];
        self.hasNextBackupWindow = self.nextBackupWindow != nil;
    }
}


#pragma mark Collections
- (PMKPromise *)getAvailableKernels {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestForSpecializedCollectionWithType:[DKKernelCollection class] andFullURL:[instance apiURLForEndpointWithComponents:@"droplets", self.dropletId, @"kernels", nil]];
}

- (PMKPromise *)getSnapshots {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestForSpecializedCollectionWithType:[DKSnapshotCollection class] andFullURL:[instance apiURLForEndpointWithComponents:@"droplets", self.dropletId, @"snapshots", nil]];
}

- (PMKPromise *)getBackups {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestForSpecializedCollectionWithType:[DKBackupCollection class] andFullURL:[instance apiURLForEndpointWithComponents:@"droplets", self.dropletId, @"backups", nil]];
}

- (PMKPromise *)getActions {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestForSpecializedCollectionWithType:[DKActionCollection class] andFullURL:[instance apiURLForEndpointWithComponents:@"droplets", self.dropletId, @"actions", nil]];
}

- (PMKPromise *)getNeighbors {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestForSpecializedCollectionWithType:[DKDropletCollection class] andFullURL:[instance apiURLForEndpointWithComponents:@"droplets", self.dropletId, @"neighbors", nil]];
}

- (PMKPromise *)getAction:(NSNumber *)actionId {
    return [[DKClient sharedInstance] getActionWithId:actionId];
}


#pragma mark DOBaseModel
- (NSString *)actionsURLWithAPIInstance:(DKClient *)instance {
    return [instance apiURLForEndpointWithComponents:@"droplets", self.dropletId, @"actions", nil];
}


#pragma mark Actions
- (PMKPromise *)disableBackups {
    return [self runAction:@"disable_backups"];
}

- (PMKPromise *)reboot {
    return [self runAction:@"reboot"];
}

- (PMKPromise *)powerCycle {
    return [self runAction:@"power_cycle"];
}

- (PMKPromise *)shutdown {
    return [self runAction:@"shutdown"];
}

- (PMKPromise *)powerOff {
    return [self runAction:@"power_off"];
}

- (PMKPromise *)powerOn {
    return [self runAction:@"power_on"];
}

- (PMKPromise *)resetPassword {
    return [self runAction:@"password_reset"];
}

- (PMKPromise *)enableIPv6 {
    return [self runAction:@"enable_ipv6"];
}

- (PMKPromise *)enablePrivateNetworking {
    return [self runAction:@"enable_private_networking"];
}

- (PMKPromise *)createSnapshot {
    return [self runAction:@"snapshot"];
}

- (PMKPromise *)upgrade  {
    return [self runAction:@"upgrade"];
}

- (PMKPromise *)destroy {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestDeleteForURL:[instance apiURLForEndpointWithComponents:@"droplets", self.dropletId, nil]];
}

- (PMKPromise *)restoreWithImage:(DKImage *)image {
    return [self restoreWithImageId:image.imageId];
}

- (PMKPromise *)restoreWithImageId:(NSNumber *)imageId {
    return [self runAction:@"restore" withData:@{ @"image": imageId }];
}

- (PMKPromise *)restoreWithImageSlug:(NSString *)imageSlug {
    return [self runAction:@"restore" withData:@{ @"image": imageSlug }];
}

- (PMKPromise *)resizeWithSize:(DKSize *)size andResizeDisks:(BOOL)resizeDisks {
    return [self runAction:@"resize" withData:@{ @"size": size.slug, @"disk": @(resizeDisks) }];
}

- (PMKPromise *)rebuildWithImage:(DKImage *)image {
    return [self rebuildWithImageId:image.imageId];
}

- (PMKPromise *)rebuildWithImageId:(NSNumber *)imageId {
    return [self runAction:@"rebuild" withData:@{ @"image": imageId }];
}

- (PMKPromise *)rebuildWithImageSlug:(NSString *)imageSlug {
    return [self runAction:@"rebuild" withData:@{ @"image": imageSlug }];
}

- (PMKPromise *)renameTo:(NSString *)name {
    return [self runAction:@"rename" withData:@{ @"name": name }];
}

- (PMKPromise *)changeKernelTo:(DKKernel *)kernel {
    return [self runAction:@"change_kernel" withData:@{ @"kernel": kernel.kernelId }];
}


@end
