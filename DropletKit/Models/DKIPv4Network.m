//
//  DKIPv4Network.m
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKIPv4Network.h"
#import "DropletKit.h"

@implementation DKIPv4Network
#pragma mark Properties
@synthesize ipAddress, gateway, type;


#pragma mark Life cycle
- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(!CHECK_DATA_CONTAINS(ip_address, netmask, gateway, type)) {
        self = nil;
    } else {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, netmask, gateway, type)
        EXPAND_DATA_LOCAL(ip_address, ipAddress)
    }
    return self;
}
@end
