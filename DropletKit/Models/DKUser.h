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
@property NSString *email;
@property NSString *uuid;

#pragma mark Renamed properties
@property NSNumber *dropletLimit;
@property BOOL emailVerified;

@end
