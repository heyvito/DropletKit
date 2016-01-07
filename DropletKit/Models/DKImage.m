//
//  DKImage.m
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKImage.h"
#import "DropletKit.h"

@implementation DKImage

#pragma mark Life cycle
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if(CHECK_DATA_CONTAINS(id, name, distribution, slug, regions, created_at, type, min_disk_size)) {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, name, distribution, slug, regions, type)
        self.isPublic = [data[@"public"] boolValue];
        EXPAND_DATA_LOCAL(min_disk_size, minDiskSize)
        EXPAND_DATA_LOCAL(id, imageId)
        EXPAND_DATA_DATE_LOCAL(created_at, createdAt)
    }
}

#pragma mark DOBaseModel
- (NSString *)actionsURLWithAPIInstance:(DKClient*)instance {
    return [instance apiURLForEndpointWithComponents:@"images", self.imageId, @"actions", nil];
}

#pragma mark Collections
- (PMKPromise *)getActions {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestForSpecializedCollectionWithType:[DKActionCollection class] andFullURL:[self actionsURLWithAPIInstance:instance]];
}

#pragma mark Actions
- (PMKPromise*)destroy {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestDeleteForURL:[instance apiURLForEndpointWithComponents:@"images", self.imageId, nil]];
}

- (PMKPromise *)renameImageTo:(NSString *)imageName {
    __weak __typeof__(self) weakSelf = self;
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject) {
        __strong __typeof__(self) strongSelf = weakSelf;
        DKClient *instance = [DKClient sharedInstance];
        NSDictionary *data = @{ @"name": imageName };
        [[instance sharedSessionManager] PUT:[instance apiURLForEndpointWithComponents:@"images", strongSelf.imageId, nil] parameters:data success:^(NSURLSessionTask *operation, id responseObject) {
            DKImage *image = [[DKImage alloc] initWithDictionary:responseObject];
            if(image) {
                fulfill(image);
            } else {
                reject([DKErrorDomain inconsistentDataReceivedFromEndpoint]);
            }
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            reject(error);
        }];
    }];
}

- (PMKPromise *)transferToRegion:(DKRegion *)region {
    return [self runAction:@"transfer" withData:@{ @"region": region.slug }];
}

- (PMKPromise *)convertToSnapshot {
    return [self runAction:@"convert"];
}

- (PMKPromise *)getActionById:(NSNumber *)actionId {
    return [[DKClient sharedInstance] getActionWithId:actionId];
}


@end
