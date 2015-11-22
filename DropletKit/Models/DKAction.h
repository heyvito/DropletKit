//
//  DKAction.h
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"


/**
 *  Actions are records of events that have occurred on the resources in the user's account. 
 *  These can be things like rebooting a Droplet, or transferring an image to a new region.
 *
 *  An action object is created every time one of these actions is initiated. The action
 *  object contains information about the current status of the action, start and complete
 *  timestamps, and the associated resource type and ID.
 */
@interface DKAction : DKBaseModel

#pragma mark Common properties

/**
 *  The current status of the action.
 *  Possible values are "in-progress", "completed", and "errored".
 */
@property NSString *status;

/**
 *  This is the type of action that the object represents.
 *  For example, this could be "transfer" to represent the state of an
 *  image transfer action.
 */
@property NSString *type;

#pragma mark Renamed properties

/**
 *  A unique numeric ID that can be used to identify and reference an action.
 */
@property NSNumber *actionId;

/**
 *  A unique identifier for the resource that the action is associated with.
 */
@property NSNumber *resourceId;

/**
 *  The type of resource that the action is associated with.
 */
@property NSString *resourceType;

/**
 *  A slug representing the region where the action occurred.
 */
@property NSString *regionSlug;

#pragma mark Extended properties

/**
 *  A date and time that represents when the action was initiated.
 */
@property NSDate *startedAt;

/**
 *  A date and time that represents when the action was completed.
 */
@property NSDate *completedAt;

@end
