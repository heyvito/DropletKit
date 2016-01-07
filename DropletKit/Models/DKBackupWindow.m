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
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if(CHECK_DATA_CONTAINS(start, end)) {
        EXPAND_DATA_DATE_LOCAL(start, windowStart)
        EXPAND_DATA_DATE_LOCAL(end, windowEnd)
    }
}
@end
