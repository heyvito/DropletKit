//
//  DKUser.h
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@interface DKUser : DKBaseModel

#pragma mark Common properties

/**
 *  The email the user has registered for Digital Ocean with
 */
@property NSString *email;

/**
 *  The universal identifier for this user
 */
@property NSString *uuid;

#pragma mark Renamed properties

/**
 *  The total number of droplets the user may have
 */
@property NSNumber *dropletLimit;

/**
 *  Whether the user has verified their account via email.
 */
@property BOOL emailVerified;

@end
