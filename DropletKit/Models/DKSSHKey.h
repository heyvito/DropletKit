//
//  DKSSHKey.h
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@class PMKPromise;

@interface DKSSHKey : DKBaseModel

#pragma mark Common properties
@property NSString *fingerprint;
@property NSString *name;

#pragma mark Renamed properties
@property NSNumber *sshKeyId;
@property NSString *publicKey;

#pragma mark Object actions
- (PMKPromise *)renameTo:(NSString *)name;
- (PMKPromise *)destroy;
@end
