//
//  DKNetworkCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKNetworkCollection.h"
#import "DropletKit.h"

@implementation DKNetworkCollection
#pragma mark Life cycle
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    NSMutableArray *v4Networks = [[NSMutableArray alloc] init];
    NSMutableArray *v6Networks = [[NSMutableArray alloc] init];
    if([[data allKeys] containsObject:@"v4"]) {
        NSArray *v4Dicts = [data objectForKey:@"v4"];
        for(NSDictionary *network in v4Dicts) {
            [v4Networks addObject:[[DKIPv4Network alloc] initWithDictionary:network]];
        }
    }
    if([[data allKeys] containsObject:@"v6"]) {
        NSArray *v6Dicts = [data objectForKey:@"v6"];
        for(NSDictionary *network in v6Dicts) {
            [v6Networks addObject:[[DKIPv6Network alloc] initWithDictionary:network]];
        }
    }
    self.ipv4Networks = v4Networks;
    self.ipv6Networks = v6Networks;
}
@end
