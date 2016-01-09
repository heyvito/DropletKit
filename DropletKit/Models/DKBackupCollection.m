//
//  DKBackupCollection.m
//  DropletKit
//
//  Created by Victor Gama on 09/01/2016.
//  Copyright © 2016 Hexic Labs. All rights reserved.
//

#import "DKBackupCollection.h"
#import <DropletKit/DropletKit.h>

@implementation DKBackupCollection
- (NSString *)expectedArrayKey {
    return @"backups";
}
- (Class)expectedResultClass {
    return [DKSnapshot class];
}
@end
