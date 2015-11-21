//
//  DKDomainRecord.h
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"
#import "Constants.h"
#import "DKChildProtocol.h"

@class DKDomain, PMKPromise;

@interface DKDomainRecord : DKBaseModel <DKChildProtocol>

#pragma mark Common properties
@property NSString *type;
@property NSString *name;
@property NSNumber *priority;
@property NSNumber *port;
@property NSNumber *weight;

#pragma mark Renamed properties
@property NSNumber *recordId;
@property NSString *recordData;

#pragma mark Extended properties
@property (readonly) DKDomain *parentDomain;

#pragma mark Object actions
- (PMKPromise *)updateRecordSetType:(DKDomainRecordType)updateType setName:(NSString *)updateName setData:(NSString *)updateData setPriority:(NSInteger)updatePriority setPort:(NSInteger)updatePort setWeight:(NSInteger)updateWeight;
- (PMKPromise *)destroy;

@end
