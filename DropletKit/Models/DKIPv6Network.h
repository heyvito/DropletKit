//
//  DKIPv6Network.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"
#import "DKNetworkModelProtocol.h"


/**
 *  Represents metadata for a given IPv4 Network
 */
@interface DKIPv6Network : DKBaseModel <DKNetworkModelProtocol>

/**
 *  Netmask for this IPv6 Network
 */
@property NSNumber *netmask;
@end
