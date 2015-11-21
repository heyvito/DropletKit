//
//  DKDomainRecordCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/7/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKDomainRecordCollection.h"
#import "DropletKit.h"

@implementation DKDomainRecordCollection
- (NSString *)expectedArrayKey {
    return @"domain_records";
}

- (Class)expectedResultClass {
    return [DKDomainRecord class];
}
@end
