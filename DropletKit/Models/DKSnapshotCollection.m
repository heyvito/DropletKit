//
//  DKSnapshotCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/7/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKSnapshotCollection.h"
#import <DropletKit/DropletKit.h>

@implementation DKSnapshotCollection
- (NSString *)expectedArrayKey {
    return @"snapshots";
}
- (Class)expectedResultClass {
    return [DKSnapshot class];
}
@end
