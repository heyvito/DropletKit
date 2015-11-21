//
//  DKNetworkModelProtocol.h
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DKNetworkModelProtocol <NSObject>
@required
@property NSString *ipAddress;
@property NSString *gateway;
@property NSString *type;
@end
