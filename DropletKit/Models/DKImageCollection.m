//
//  DKImageCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/7/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKImageCollection.h"
#import "DropletKit.h"

@implementation DKImageCollection
- (NSString *)expectedArrayKey {
    return @"images";
}

- (Class)expectedResultClass {
    return [DKImage class];
}
@end
