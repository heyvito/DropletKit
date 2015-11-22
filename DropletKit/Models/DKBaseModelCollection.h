//
//  DKBaseModelCollection.h
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMKPromise;


/**
 *  Represents a collection of an object.
 *  This class is inherited by model collections, such as 
 *  `DKActionCollection`, `DKImageCollection`, etc.
 */
@interface DKBaseModelCollection : NSObject

/**
 *  List of objects returned by the remote endpoint.
 */
@property NSArray *objects;

/**
 *  Total objects available in the endpoint.
 */
@property NSNumber *totalObjects;

/**
 *  Whether the next page can be fetched or not.
 */
@property BOOL hasNextPage;

- (instancetype)initWithJsonData:(NSData *)blob;

/**
 *  Fetches the next set of objects on the remote endpoint.
 *
 *  @return A `PMKPromise` that will be fulfilled whenever the requests
 *          succeeds or fails.
 *  @warning Parameter type for `then` has the same type of this collection.
 *  @warning Ensure to check if `hasNextPage`. Calling this method
 *  when there are no more data available on the remote server will
 *  raise an exception.
 */
- (PMKPromise *)fetchNextPage;
- (NSArray *)processJSONArray:(NSArray *)array;
- (NSString *)expectedArrayKey;
- (Class)expectedResultClass;
@end
