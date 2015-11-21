//
//  DKRegionCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/7/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKRegionCollection.h"
#import "DropletKit.h"

@implementation DKRegionCollection
- (NSString *)expectedArrayKey {
    return @"regions";
}

- (Class)expectedResultClass {
    return [DKRegion class];
}
@end
