//
//  DKSSHKey.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKSSHKey.h"
#import "DropletKit.h"

@implementation DKSSHKey

#pragma mark Life cycle
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if([[data allKeys] containsObject:@"ssh_key"]) {
        data = [data objectForKey:@"ssh_key"];
    }
    if(CHECK_DATA_CONTAINS(id, fingerprint, public_key, name)) {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, fingerprint, name)
        EXPAND_DICT_LOCAL(data, public_key, publicKey)
        EXPAND_DICT_LOCAL(data, id, sshKeyId)
    }
}


#pragma mark Actions
- (PMKPromise *)destroy {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestDeleteForURL:[instance apiURLForEndpointWithComponents:@"account", @"keys", self.fingerprint, nil]];
}

- (PMKPromise *)renameTo:(NSString *)name {
    __weak __typeof__(self) weakSelf = self;
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject) {
        __strong __typeof__(self) strongSelf = weakSelf;
        DKClient *instance = [DKClient sharedInstance];
        NSDictionary *data = @{ @"name": name };
        [[instance sharedSessionManager] PUT:[instance apiURLForEndpointWithComponents:@"account", @"keys", strongSelf.fingerprint, nil] parameters:data success:^(NSURLSessionTask *operation, id responseObject) {
            DKSSHKey *key = [[DKSSHKey alloc] initWithDictionary:responseObject];
            if(key) {
                fulfill(key);
            } else {
                reject([DKErrorDomain inconsistentDataReceivedFromEndpoint]);
            }
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            reject(error);
        }];
    }];
}
@end
