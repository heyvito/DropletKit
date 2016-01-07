//
//  DKDomain.m
//  DropletKit
//
//  Created by Victor Gama on 5/5/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKDomain.h"
#import "DropletKit.h"

@implementation DKDomain

#pragma mark Life cycle
- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    if([[data allKeys] containsObject:@"domain"]) {
        data = [data objectForKey:@"domain"];
    }
    if(CHECK_DATA_CONTAINS(name, ip_address, zone_file)) {
        CALL_MACRO_X_FOR_EACH(EXPAND_DATA, name, ttl);
        EXPAND_DATA_LOCAL(zone_file, zoneFile)
    }
}


#pragma mark Collections

- (PMKPromise *)domainRecords {
    DKClient *instance = [DKClient sharedInstance];
    NSString *url = [instance apiURLForEndpointWithComponents:@"domains", self.name, @"records", nil];
    return [instance requestForSpecializedCollectionWithType:[DKDomainRecordCollection class] andFullURL:url andParent:self];
}


#pragma mark Actions
- (PMKPromise *)destroy {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestDeleteForURL:[instance apiURLForEndpointWithComponents:@"domains", self.name, nil]];
}

- (PMKPromise *)createRecordWithType:(DKDomainRecordType)type andName:(NSString *)recordName andData:(NSString *)data andPriority:(NSInteger)priority andPort:(NSInteger)port andWeight:(NSInteger)weight {
    __weak __typeof__(self) weakSelf = self;
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject) {
        __strong __typeof__(self) strongSelf = weakSelf;
        if(type <= 5 && type != 3 && !recordName) {
            NSString *reason = [NSString stringWithFormat:@"name argument required to type %@", DKDomainRecordTypeValue(type)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        if(!data) {
            NSString *reason = [NSString stringWithFormat:@"data argument required to type %@", DKDomainRecordTypeValue(type)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        if(type >= DKDomainRecordType_MX && type <= DKDomainRecordType_SRV && type != DKDomainRecordType_TXT && !priority) {
            NSString *reason = [NSString stringWithFormat:@"priority argument required to type %@", DKDomainRecordTypeValue(type)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        if(type == DKDomainRecordType_SRV && !port) {
            NSString *reason = [NSString stringWithFormat:@"port argument required to type %@", DKDomainRecordTypeValue(type)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        if(type == DKDomainRecordType_SRV && !weight) {
            NSString *reason = [NSString stringWithFormat:@"weight argument required to type %@", DKDomainRecordTypeValue(type)];
            reject([DKErrorDomain inconsistentArgumentsWithReason:reason]);
            return;
        }
        NSDictionary *rawRequestData = @{
                                         @"type": DKDomainRecordTypeValue(type),
                                         @"name": recordName,
                                         @"data": data,
                                         @"priority": [NSNumber numberWithInteger:priority],
                                         @"port": [NSNumber numberWithInteger:port],
                                         @"weight": [NSNumber numberWithInteger:weight]
                                         };
        NSMutableDictionary *requestData = [[NSMutableDictionary alloc] init];
        for(NSString *key in [rawRequestData allKeys]) {
            id value = rawRequestData[key];
            if(value) {
                [requestData setObject:value forKey:key];
            }
        }
        DKClient *instance = [DKClient sharedInstance];
        [instance requestCreateForURL:[instance apiURLForEndpointWithComponents:@"domains", strongSelf.name, @"records", nil] withData:requestData].then(^(id result) {
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
            reject(error);
        });
    }];
}

@end
