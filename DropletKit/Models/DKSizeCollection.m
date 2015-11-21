//
//  DKSizeCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/7/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKSizeCollection.h"
#import "Models.h"

@implementation DKSizeCollection
- (NSString *)expectedArrayKey {
    return @"sizes";
}
- (Class)expectedResultClass {
    return [DKSize class];
}
@end
