//
//  DKKernel.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"


/**
 *  Represents a Kernel version on the DigitalOcean infrastructure.
 *  Each kernel comes with a a name, version, patch and release information
 */
@interface DKKernel : DKBaseModel

#pragma mark Common properties

/**
 *  The display name of the kernel. This is shown in the web UI
 *  and is generally a descriptive title for the kernel in question.
 */
@property NSString *name;

/**
 *  A standard kernel version string representing the version, patch,
 *  and release information.
 */
@property NSString *version;

#pragma mark Renamed properties

/**
 *  A unique number used to identify and reference a specific kernel.
 */
@property NSNumber *kernelId;

@end
