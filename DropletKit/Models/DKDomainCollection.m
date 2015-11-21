//
//  DKDomainCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKDomainCollection.h"
#import <DropletKit/DropletKit.h>

@implementation DKDomainCollection
- (NSString *)expectedArrayKey {
    return @"domains";
}

- (Class)expectedResultClass {
    return [DKDomain class];
}
@end
