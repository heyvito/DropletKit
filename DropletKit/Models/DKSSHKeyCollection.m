//
//  DKSSHKeyCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/7/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKSSHKeyCollection.h"
#import <DropletKit/DropletKit.h>

@implementation DKSSHKeyCollection
- (NSString *)expectedArrayKey {
    return @"ssh_keys";
}

- (Class)expectedResultClass {
    return [DKSSHKey class];
}
@end
