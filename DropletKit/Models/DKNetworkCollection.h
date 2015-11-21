//
//  DKNetworkCollection.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@interface DKNetworkCollection : DKBaseModel
@property NSArray *ipv4Networks;
@property NSArray *ipv6Networks;
@end
