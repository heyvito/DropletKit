//
//  DKNetworkCollection.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@interface DKNetworkCollection : DKBaseModel

/**
 *  An list of IPv4 Networks
 */
@property NSArray *ipv4Networks;

/**
 *  An list of IPv6 Networks
 */
@property NSArray *ipv6Networks;

@end
