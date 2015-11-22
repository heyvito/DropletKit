//
//  DKSSHKey.h
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@class PMKPromise;


/**
 *  DigitalOcean allows users to add SSH public keys to the interface so
 *  that they can embed their public key into a Droplet at the time of
 *  creation. 
 *  Only the public key is required to take advantage of this functionality.
 */
@interface DKSSHKey : DKBaseModel

#pragma mark Common properties

/**
 *  This attribute contains the fingerprint value that is generated from the public key. 
 *  This is a unique identifier that will differentiate it from other keys using a format
 *  that SSH recognizes.
 */
@property NSString *fingerprint;

/**
 *  This is the human-readable display name for the given SSH key.
 *  This is used to easily identify the SSH keys when they are displayed.
 */
@property NSString *name;

#pragma mark Renamed properties

/**
 *  This is a unique identification number for the key.
 *  This can be used to reference a specific SSH key when you wish to embed a key into a Droplet.
 */
@property NSNumber *sshKeyId;

/**
 *  This attribute contains the entire public key string that was uploaded.
 *  This is what is embedded into the root user's authorized_keys file if you
 *  choose to include this SSH key during Droplet creation.
 */
@property NSString *publicKey;

#pragma mark Object actions

/**
 *  Renames this key
 *
 *  @param name The new key name
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `SKSSHKey *`
 */
- (PMKPromise *)renameTo:(NSString *)name;

/**
 *  Destroys this key.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `id`, and will be `[NSNull null]`,
 *           even if the operation succeeds.
 */
- (PMKPromise *)destroy;
@end
