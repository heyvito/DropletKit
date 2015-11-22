//
//  DKClient.h
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager, PMKPromise, DKRegion, DKSize, DKImage;

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

/**
 *  Creates a new Droplet for the Authenticated user
 *
 *  @param name   The human-readable string you wish to use when displaying
 *                the Droplet name. The name, if set to a domain name managed
 *                in the DigitalOcean DNS management system, will configure a
 *                PTR record for the Droplet. The name set during creation will
 *                also determine the hostname for the Droplet in its internal
 *                configuration.
 *  @param image  The DKImage to base the new droplet.
 *  @param size   DKSize instance that you wish to select for this Droplet.
 *  @param region DKRegion instance of the region that you wish to deploy in.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDroplet *`
 */
- (PMKPromise *)createDropletWithName:(NSString *)name image:(DKImage *)image andSize:(DKSize *)size onRegion:(DKRegion *)region;

/**
 *  Creates a new Droplet for the Authenticated user
 *
 *  @param name   The human-readable string you wish to use when displaying
 *                the Droplet name. The name, if set to a domain name managed
 *                in the DigitalOcean DNS management system, will configure a
 *                PTR record for the Droplet. The name set during creation will
 *                also determine the hostname for the Droplet in its internal
 *                configuration.
 *  @param image  The DKImage to base the new droplet.
 *  @param size   DKSize instance that you wish to select for this Droplet.
 *  @param region DKRegion instance of the region that you wish to deploy in.
 *  @param keys   NSArray containing DKSSHKeys or SSH Key's Fingerprints.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDroplet *`
 */
- (PMKPromise *)createDropletWithName:(NSString *)name image:(DKImage *)image andSize:(DKSize *)size onRegion:(DKRegion *)region withSSHKeys:(NSArray *)keys;

/**
 *  Creates a new Droplet for the Authenticated user
 *
 *  @param name    The human-readable string you wish to use when displaying
 *                 the Droplet name. The name, if set to a domain name managed
 *                 in the DigitalOcean DNS management system, will configure a
 *                 PTR record for the Droplet. The name set during creation will
 *                 also determine the hostname for the Droplet in its internal
 *                 configuration.
 *  @param image   The DKImage to base the new droplet.
 *  @param size    DKSize instance that you wish to select for this Droplet.
 *  @param region  DKRegion instance of the region that you wish to deploy in.
 *  @param keys    NSArray containing DKSSHKeys or SSH Key's Fingerprints.
 *  @param backups A boolean indicating whether automated backups should be enabled
 *                 for the Droplet. Automated backups can only be enabled when the
 *                 Droplet is created.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDroplet *`
 */
- (PMKPromise *)createDropletWithName:(NSString *)name image:(DKImage *)image andSize:(DKSize *)size onRegion:(DKRegion *)region withSSHKeys:(NSArray *)keys enableBackups:(BOOL)backups;

/**
 *  Creates a new Droplet for the Authenticated user
 *
 *  @param name    The human-readable string you wish to use when displaying
 *                 the Droplet name. The name, if set to a domain name managed
 *                 in the DigitalOcean DNS management system, will configure a
 *                 PTR record for the Droplet. The name set during creation will
 *                 also determine the hostname for the Droplet in its internal
 *                 configuration.
 *  @param image   The DKImage to base the new droplet.
 *  @param size    DKSize instance that you wish to select for this Droplet.
 *  @param region  DKRegion instance of the region that you wish to deploy in.
 *  @param keys    NSArray containing DKSSHKeys or SSH Key's Fingerprints.
 *  @param backups A boolean indicating whether automated backups should be enabled
 *                 for the Droplet. Automated backups can only be enabled when the
 *                 Droplet is created.
 *  @param ipv6    A boolean indicating whether IPv6 is enabled on the Droplet.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDroplet *`
 */
- (PMKPromise *)createDropletWithName:(NSString *)name image:(DKImage *)image andSize:(DKSize *)size onRegion:(DKRegion *)region withSSHKeys:(NSArray *)keys enableBackups:(BOOL)backups enableIPv6:(BOOL)ipv6;

/**
 *  Creates a new Droplet for the Authenticated user
 *
 *  @param name          The human-readable string you wish to use when displaying
 *                       the Droplet name. The name, if set to a domain name managed
 *                       in the DigitalOcean DNS management system, will configure a
 *                       PTR record for the Droplet. The name set during creation will
 *                       also determine the hostname for the Droplet in its internal
 *                       configuration.
 *  @param image         The DKImage to base the new droplet.
 *  @param size          DKSize instance that you wish to select for this Droplet.
 *  @param region        DKRegion instance of the region that you wish to deploy in.
 *  @param keys          NSArray containing DKSSHKeys or SSH Key's Fingerprints.
 *  @param backups       A boolean indicating whether automated backups should be enabled
 *                       for the Droplet. Automated backups can only be enabled when the
 *                       Droplet is created.
 *  @param ipv6          A boolean indicating whether IPv6 is enabled on the Droplet.
 *  @param enablePrivNet A boolean indicating whether private networking is enabled
 *                       for the Droplet. Private networking is currently only available in certain regions.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDroplet *`
 */
- (PMKPromise *)createDropletWithName:(NSString *)name image:(DKImage *)image andSize:(DKSize *)size onRegion:(DKRegion *)region withSSHKeys:(NSArray *)keys enableBackups:(BOOL)backups enableIPv6:(BOOL)ipv6 enablePrivateNetworking:(BOOL)enablePrivNet;

/**
 *  Creates a new Domain for the authenticated user.
 *
 *  @param name The domain name to add to the DigitalOcean DNS management interface.
 *              The name must be unique in DigitalOcean's DNS system. The operation
 *              will fail if the name has already been taken.
 *  @param ip   The IP address you want the domain to point
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDomain *`
 */
- (PMKPromise *)createDomainWithName:(NSString *)name andIPAddress:(NSString *)ip;


/**
 *  Creates a new SSH Key for the authenticated user.
 *
 *  @param name     The name to give the new SSH key in the user's account.
 *  @param contents A string containing the entire public key.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKSSHKey *`
 */
- (PMKPromise *)createSSHKeyWithName:(NSString *)name andContents:(NSString *)contents;

/**
 *  Gets an OAuth Authorization URL to request an User access to their account.
 *
 *  @param key   Your application key, obtained when you registered it with DigitalOcean
 *  @param uri   Redirect URI to redirect the user after they allow access to their account
 *  @param write Whether you need Write permission to their account or not
 *
 *  @return An URL poiting to the authorization endpoint
 */
- (NSString *)getOAuthAuthorizationURLWithApplicationKey:(NSString *)key RedirectURI:(NSString *)uri andWriteScope:(BOOL)write;


/**
 *  Exchanges a authorization code with an access token
 *
 *  @param code   Token obtained when the user was redirected back to your application
 *  @param uri    Redirect URI used when requesting access to the user's account
 *  @param key    Your application key, obtained when you registered it with DigitalOcean
 *  @param secret Your application secret, obtained when you registered it with DigitalOcean
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKOAuthResponse *`
 */
- (PMKPromise *)exchangeOAuthCode:(NSString *)code withRedirectURI:(NSString *)uri applicationKey:(NSString *)key andSecret:(NSString *)secret;
@end
