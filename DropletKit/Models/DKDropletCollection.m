//
//  DKDropletCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKDropletCollection.h"
#import "DropletKit.h"

@implementation DKDropletCollection
- (NSString *)expectedArrayKey {
    return @"droplets";
}

- (Class)expectedResultClass {
    return [DKDroplet class];
}
@end
