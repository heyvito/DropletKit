//
//  DKNetworkCollection.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"


/**
 *  Represents a collection of networks, containing
 *  information about IPv4 and IPv6 networks.
 */
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
