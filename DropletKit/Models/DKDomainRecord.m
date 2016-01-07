//
//  DKDomainRecord.m
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKDomainRecord.h"
#import "DropletKit.h"

@implementation DKDomainRecord{
    DKDomain *_parentDomain;
}

#pragma mark Properties
@synthesize parentDomain = _parentDomain;


#pragma mark Life cycle
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    _parentDomain = nil;
    if([[data allKeys] containsObject:@"domain_record"]) {
        data = [data objectForKey:@"domain_record"];
    }
    if(CHECK_DATA_CONTAINS(id, type, name, data, priority, port, weight)) {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, type, name, priority, port, weight)
        EXPAND_DATA_LOCAL(id, recordId)
        EXPAND_DATA_LOCAL(data, recordData)
    }
}


#pragma mark DOChildProtocol
- (void)setParent:(id)parent {
    _parentDomain = parent;
}


#pragma mark Actions

- (PMKPromise *)destroy {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestDeleteForURL:[instance apiURLForEndpointWithComponents:@"domains", self.parentDomain.name, @"records", self.recordId, nil]];
}

- (PMKPromise *)updateRecordSetType:(DKDomainRecordType)updateType setName:(NSString *)updateName setData:(NSString *)updateData setPriority:(NSInteger)updatePriority setPort:(NSInteger)updatePort setWeight:(NSInteger)updateWeight {
    __weak __typeof__(self) weakSelf = self;
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject) {
        __strong __typeof__(self) strongSelf = weakSelf;
        if(updateType <= 5 && updateType != 3 && !updateName) {
            NSString *reason = [NSString stringWithFormat:@"name argument required to type %@", DKDomainRecordTypeValue(updateType)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        if(!updateData) {
            NSString *reason = [NSString stringWithFormat:@"data argument required to type %@", DKDomainRecordTypeValue(updateType)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        if(updateType >= DKDomainRecordType_MX && updateType <= DKDomainRecordType_SRV && updateType != DKDomainRecordType_TXT && !updatePriority) {
            NSString *reason = [NSString stringWithFormat:@"priority argument required to type %@", DKDomainRecordTypeValue(updateType)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        if(updateType == DKDomainRecordType_SRV && !updatePort) {
            NSString *reason = [NSString stringWithFormat:@"port argument required to type %@", DKDomainRecordTypeValue(updateType)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        if(updateType == DKDomainRecordType_SRV && !updateWeight) {
            NSString *reason = [NSString stringWithFormat:@"weight argument required to type %@", DKDomainRecordTypeValue(updateType)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        NSDictionary *rawRequestData = @{
                                         @"type": DKDomainRecordTypeValue(updateType),
                                         @"name": updateName,
                                         @"data": updateData,
                                         @"priority": [NSNumber numberWithInteger:updatePriority],
                                         @"port": [NSNumber numberWithInteger:updatePort],
                                         @"weight": [NSNumber numberWithInteger:updateWeight]
                                         };
        NSMutableDictionary *requestData = [[NSMutableDictionary alloc] init];
        for(NSString *key in [rawRequestData allKeys]) {
            id value = rawRequestData[key];
            if(value) {
                [requestData setObject:value forKey:key];
            }
        }
        DKClient *instance = [DKClient sharedInstance];
        [instance requestUpdateForURL:[instance apiURLForEndpointWithComponents:@"domains", strongSelf.parentDomain.name, @"records", strongSelf.recordId, nil] withData:requestData].then(^(id result) {
            if(![result isKindOfClass:[NSDictionary class]]) {
                reject([DKErrorDomain inconsistentDataReceivedFromEndpoint]);
                return;
            }
            DKDomainRecord *record = [[DKDomainRecord alloc] initWithDictionary:result];
            if(record) {
                fulfill(record);
            } else {
                reject([DKErrorDomain inconsistentDataReceivedFromEndpoint]);
            }
        }).catch(^(NSError *error) {
            reject([DKErrorDomain tryTranslateAFError:error]);
        });
    }];
}


@end
