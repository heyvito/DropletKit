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


/**
 *  Domain resources are domain names that the user
 *  have purchased from a domain name registrar that
 *  they can manage through the DigitalOcean DNS interface.
 */
@interface DKDomain : DKBaseModel

#pragma mark Common properties

/**
 *  The name of the domain itself. This should follow the standard
 *  domain format of domain.TLD. For instance, example.com is a valid
 *  domain name.
 */
@property NSString *name;

/**
 *  This value is the time to live for the records on this domain,
 *  in seconds. This defines the time frame that clients can cache
 *  queried information before a refresh should be requested.
 */
@property NSNumber *ttl;

#pragma mark Renamed properties

/**
 *  This attribute contains the complete contents of the zone file for
 *  the selected domain. Individual domain record resources should be used
 *  to get more granular control over records. However, this attribute can
 *  also be used to get information about the SOA record, which is created
 *  automatically and is not accessible as an individual record resource.
 */
@property NSString *zoneFile;


#pragma mark Related collections

/**
 *  Gets a list of domain records for this domain.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDomain`
 */
- (PMKPromise *)domainRecords;

/**
 *  Deletes this domain.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `id`, and will be `[NSNull null]`,
 *           even if the operation succeeds.
 */
- (PMKPromise *)destroy;

/**
 *  Creates a new domain record for this domain.
 *
 *  @param type       The record type (A[AAA], CNAME, MX, TXT, SRV or NS).
 *  @param recordName The host name, alias, or service being defined by the record.
 *                    This field is required for domains of type A[AAA], CNAME, TXT
 *                    and SRV.
 *  @param data       Variable data depending on record type.
 *                    This field is required for domains of type A[AAA], CNAME, MX,
 *                    TXT, NS and SRV.
 *  @param priority   The priority of the host (for SRV and MX records. `nil` otherwise).
 *  @param port       The port that the service is accessible on (for SRV records only. `nil` otherwise).
 *  @param weight     The weight of records with the same priority (for SRV records only. `nil` otherwise).
 *
 *  @return  A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDomainRecord`
 */
- (PMKPromise *)createRecordWithType:(DKDomainRecordType)type andName:(NSString *)recordName andData:(NSString *)data andPriority:(NSInteger)priority andPort:(NSInteger)port andWeight:(NSInteger)weight;


@end
