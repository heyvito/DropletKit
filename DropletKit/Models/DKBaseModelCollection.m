//
//  DKBaseModelCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "../Thirdparty/PromiseKit/PromiseKit.h"
#import <AFNetworking/AFNetworking.h>

#import "DKBaseModelCollection.h"
#import "DKClient.h"
#import "DKErrorDomain.h"

@implementation DKBaseModelCollection{
    NSString *nextPage;
    NSDictionary *initialDictionary;
}
- (instancetype)initWithJsonData:(NSData *)blob {
    self = [super init];
    nextPage = nil;
    if(blob == nil) {
        self = nil;
    } else {
        NSError *error = nil;
        id object = [NSJSONSerialization JSONObjectWithData:blob options:0 error:&error];
        if(error != nil) {
            self = nil;
        } else {
            if(![object isKindOfClass:[NSDictionary class]]) {
                self = nil;
            } else {
                NSDictionary *data = object;
                self = [self initWithDictionary:data];
            }
        }
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    initialDictionary = data;
    NSSet *expectedKeys = [NSSet setWithArray: @[ @"meta", @"links", [self expectedArrayKey]]];
    if(![expectedKeys intersectsSet:[NSSet setWithArray:[data allKeys]]]) {
        self = nil;
    } else {
        NSDictionary *links = data[@"links"];
        NSDictionary *meta = data[@"meta"];
        self.totalObjects = meta[@"total"];
        if([[links allKeys] containsObject:@"pages"] && [[links[@"pages"] allKeys] containsObject:@"next"]) {
            self.hasNextPage = YES;
            nextPage = [links[@"pages"][@"next"] stringByReplacingOccurrencesOfString:@"http:" withString:@"https:"];
        }
        self.objects = [self processJSONArray:data[[self expectedArrayKey]]];
    }
    return self;
}

- (PMKPromise *)fetchNextPage {
    if(!nextPage || !self.hasNextPage) {
        [NSException raise:@"Cannot fetch next page: there is no next page on the collection" format: @"Cannot fetch next page: there is no next page on the collection", nil];
    }
    __weak __typeof__(self) weakSelf = self;
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject) {
        __strong __typeof__(self) strongSelf = weakSelf;
        [[[DKClient sharedInstance] sharedSessionManager] GET:nextPage parameters:nil progress:nil success:^(NSURLSessionTask *operation, id responseObject) {
            id instance = [[[strongSelf class] alloc] initWithDictionary:responseObject];
            if(!instance) {
                reject([DKErrorDomain inconsistentDataReceivedFromEndpoint]);
            } else {
                fulfill(instance);
            }
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            reject([DKErrorDomain tryTranslateAFError:error]);
        }];
    }];
}

- (NSArray *)processJSONArray:(NSArray*)array {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(NSDictionary *data in array) {
        id instance = [[self expectedResultClass] alloc];
        instance = [instance initWithDictionary:data];
        if(instance) {
            [result addObject:instance];
        }
    }
    return result;
}

- (NSString *)expectedArrayKey {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (Class)expectedResultClass {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithDictionary:initialDictionary];
}

@end
