//
//  DKKernel.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@interface DKKernel : DKBaseModel

#pragma mark Common properties
@property NSString *name;
@property NSString *version;

#pragma mark Renamed properties
@property NSNumber *kernelId;

@end
