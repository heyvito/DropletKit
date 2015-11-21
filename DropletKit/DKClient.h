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

/**
 *  Gets or sets the authenticationToken for the requests made with the library
 */
@property NSString *authenticationToken;

/**
 *  Automatically updated, indicates how many requests per hour DigitalOcean
 *  offers.
 */
@property (readonly) NSNumber *requestsPerHour;

/**
 *  Automatically updated, indicates how many requests your authenticationToken
 *  can still issue.
 */
@property (readonly) NSNumber *requestsLeft;

/**
 *  Automatically updated, indicates when the rate limit for the current
 *  authenticationToken will be reset.
 */
@property (readonly) NSDate *rateLimitReset;
@property NSDictionary *requestHeaders;

/**
 *  Sets the access token used by the application to perform requests on
 *  behalf a user.
 *
 *  @param token Token value acquired through the OAuth authentication method,
 *               generated on the Control Panel
 */
+ (void)setAuthenticationToken:(NSString *)token;

/**
 *  Returns the DropletKit singleton instance
 *
 *  @return The shared DKClient instance
 */
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

/**
 *  Gets information about the authenticated account
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKUser *`.
 */
- (PMKPromise *)getAccountInfo;

/**
 *  Gets a list of droplets owned by the authenticated
 *  user
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDropletCollection *`
 */
- (PMKPromise *)getDroplets;

/**
 *  Gets a list of actions performed on droplets, including their
 *  start time and status.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKActionCollection *`
 */
- (PMKPromise *)getActions;

/**
 *  Gets an action with a given ID
 *
 *  @param actionId ID of the action to be get
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKAction *`
 */
- (PMKPromise *)getActionWithId:(NSNumber *)actionId;

/**
 *  Gets a list of domains held by the authenticated user.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDomainCollection *`
 */
- (PMKPromise *)getDomains;


/**
 *  Gets a list of available images for the authenticated user. This list
 *  may contain up to three different kinds of images:
 *  1. An automatic backup of a Droplet
 *  2. An snapshot taken from a Droplet
 *  3. Public Linux distribution or Application Image used as base to create
 *  new droplets
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKImageCollection *`
 */
- (PMKPromise *)getImages;

/**
 *  Gets a list of available distribution images. Those images are base Linux
 *  installations used to create new Droplets.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKImageCollection *`
 */
- (PMKPromise *)getDistributionImages;

/**
 *  Gets a list of available application images. Those images are base application
 *  installations used to create new Droplets.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKImageCollection *`
 */
- (PMKPromise *)getApplicationImages;

/**
 *  Gets a list of images held by the authenticated user. Those images represent
 *  snapshots and backups of droplets.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKImageCollection *`
 */
- (PMKPromise *)getUserImages;

/**
 *  Gets all Public SSH keys for the authenticated user.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKSSHKeyCollection *`
 */
- (PMKPromise *)getSSHKeys;

/**
 *  Gets a list of DigitalOcean's DataCenters where Droplets can be
 *  deployed and images can be tranferred.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKRegionCollection *`
 */
- (PMKPromise *)getRegions;

/**
 *  Gets a list of packages of hardware resources that can be used by Droplets
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKSizeCollection *`
 */
- (PMKPromise *)getSizes;
@end
