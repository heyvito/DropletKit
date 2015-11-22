//
//  DKNetworkModelProtocol.h
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  Represents a Network model
 */
@protocol DKNetworkModelProtocol <NSObject>
@required

/**
 *  IP address for this network
 */
@property NSString *ipAddress;

/**
 *  Gateway for this network
 */
@property NSString *gateway;

/**
 *  Network type
 */
@property NSString *type;
@end
