//
//  DKDomain.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"
#import "Constants.h"
@class PMKPromise;

@interface DKDomain : DKBaseModel

#pragma mark Common properties
@property NSString *name;
@property NSNumber *ttl;


#pragma mark Renamed properties
@property NSString *zoneFile;


#pragma mark Related collections
- (PMKPromise *)domainRecords;
- (PMKPromise *)destroy;
- (PMKPromise *)createRecordWithType:(DKDomainRecordType)type andName:(NSString *)recordName andData:(NSString *)data andPriority:(NSInteger)priority andPort:(NSInteger)port andWeight:(NSInteger)weight;


@end
