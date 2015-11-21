//
//  DKClient.h
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager, PMKPromise;

@interface DKClient : NSObject
@property NSString *authenticationToken;
@property NSNumber *requestsPerHour;
@property NSNumber *requestsLeft;
@property NSDate *rateLimitReset;
@property NSDictionary *requestHeaders;

+ (void)setAuthenticationToken:(NSString *)token;
+ (instancetype)sharedInstance;

- (NSString *)apiURLForEndpoint:(NSString *)endpoint;
- (NSString *)apiURLForEndpointWithComponents:(NSString *)firstComponent, ... NS_REQUIRES_NIL_TERMINATION;
- (AFHTTPSessionManager *)sharedSessionManager;
- (PMKPromise *)requestForSpecializedCollectionWithType:(Class)type andFullURL:(NSString *)url;
- (PMKPromise *)requestForSpecializedCollectionWithType:(Class)type andFullURL:(NSString *)url andParent:(id)parent;
- (PMKPromise *)requestForItemWithType:(Class)type andFullURL:(NSString *)url;
- (PMKPromise *)requestDeleteForURL:(NSString *)url;
- (PMKPromise *)requestCreateForURL:(NSString *)url withData:(NSDictionary *)data;
- (PMKPromise *)requestUpdateForURL:(NSString *)url withData:(NSDictionary *)data;
- (PMKPromise *)requestAction:(NSString *)action forUrl:(NSString *)url;
- (PMKPromise *)requestAction:(NSString *)action forUrl:(NSString *)url andData:(NSDictionary *)data;


- (PMKPromise *)getAccountInfo;
- (PMKPromise *)getDroplets;
- (PMKPromise *)getActions;
- (PMKPromise *)getActionWithId:(NSNumber *)actionId;
- (PMKPromise *)getDomains;


- (PMKPromise *)getImages;
- (PMKPromise *)getDistributionImages;
- (PMKPromise *)getApplicationImages;
- (PMKPromise *)getUserImages;

- (PMKPromise *)getSSHKeys;
- (PMKPromise *)getRegions;
- (PMKPromise *)getSizes;
@end
