//
//  DKUser.m
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKUser.h"
#import "DropletKit.h"

@implementation DKUser

#pragma mark Life cycle
- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if([[data allKeys] containsObject:@"account"]) {
        data = [data objectForKey:@"account"];
    }
    if(!CHECK_DATA_CONTAINS(email, uuid, droplet_limit, email_verified)) {
        self = nil;
    } else {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, email, uuid)
        EXPAND_DICT_LOCAL(data, droplet_limit, dropletLimit)
        EXPAND_DICT_LOCAL_BOOL(data, email_verified, emailVerified)
    }
    return self;
}

@end
