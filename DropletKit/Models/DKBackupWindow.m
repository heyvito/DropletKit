//
//  DKBackupWindow.m
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBackupWindow.h"
#import <DropletKit/DropletKit.h>

@implementation DKBackupWindow

#pragma mark Life cycle
- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(!CHECK_DATA_CONTAINS(start, end)) {
        self = nil;
    } else {
        EXPAND_DATA_DATE_LOCAL(start, windowStart)
        EXPAND_DATA_DATE_LOCAL(end, windowEnd)
    }
    return self;
}
@end
