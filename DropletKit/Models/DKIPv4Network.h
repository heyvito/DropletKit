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
@property NSString *netmask;
@end
