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


/**
 *  Domain record resources are used to set or retrieve
 *  information about the individual DNS records configured
 *  for a domain. This allows the user to build and manage
 *  DNS zone files by adding and modifying individual records
 *  for a domain.
 */
@interface DKDomainRecord : DKBaseModel <DKChildProtocol>

#pragma mark Common properties

/**
 *  The type of the DNS record (ex: A, CNAME, TXT, ...).
 */
@property NSString *type;

/**
 *  The name to use for the DNS record.
 */
@property NSString *name;

/**
 *  The priority for SRV and MX records.
 */
@property NSNumber *priority;

/**
 *  The port for SRV records.
 */
@property NSNumber *port;

/**
 *  The weight for SRV records.
 */
@property NSNumber *weight;

#pragma mark Renamed properties

/**
 *  A unique identifier for each domain record.
 */
@property NSNumber *recordId;

/**
 *  The value to use for the DNS record.
 */
@property NSString *recordData;

#pragma mark Extended properties

/**
 *  The `DKDomain` that holds this domain record
 */
@property (readonly) DKDomain *parentDomain;

#pragma mark Object actions

/**
 *  Updates this domain record.
 *
 *  @param updateType     The record type (A[AAA], CNAME, MX, TXT, SRV or NS).
 *  @param updateName     The host name, alias, or service being defined by the record.
 *                        This field is required for domains of type A[AAA], CNAME, TXT
 *                        and SRV.
 *  @param updateData     Variable data depending on record type.
 *                        This field is required for domains of type A[AAA], CNAME, MX,
 *                        TXT, NS and SRV.
 *  @param updatePriority The priority of the host (for SRV and MX records. `nil` otherwise).
 *  @param updatePort     The port that the service is accessible on (for SRV records only. `nil` otherwise).
 *  @param updateWeight   The weight of records with the same priority (for SRV records only. `nil` otherwise).
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `DKDomainRecord *`
 */
- (PMKPromise *)updateRecordSetType:(DKDomainRecordType)updateType setName:(NSString *)updateName setData:(NSString *)updateData setPriority:(NSInteger)updatePriority setPort:(NSInteger)updatePort setWeight:(NSInteger)updateWeight;

/**
 *  Deletes this domain record.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` is `id`, and will be `[NSNull null]`,
 *           even if the operation succeeds.
 */
- (PMKPromise *)destroy;

@end
