//
//  DKIPv4Network.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"
#import "DKNetworkModelProtocol.h"

@interface DKIPv4Network : DKBaseModel <DKNetworkModelProtocol>

/**
 *  Netmask for this IPv4 Network
 */
@property NSString *netmask;

@end
