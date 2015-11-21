//
//  DKActionCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKActionCollection.h"
#import "DropletKit.h"

@implementation DKActionCollection
- (NSString *)expectedArrayKey {
    return @"actions";
}

- (Class)expectedResultClass {
    return [DKAction class];
}
@end
