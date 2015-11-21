//
//  DKBaseModelCollection.h
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMKPromise;

@interface DKBaseModelCollection : NSObject
@property NSArray *objects;
@property NSNumber *totalObjects;
@property BOOL hasNextPage;

- (instancetype)initWithJsonData:(NSData *)blob;
- (PMKPromise *)fetchNextPage;
- (NSArray *)processJSONArray:(NSArray *)array;
- (NSString *)expectedArrayKey;
- (Class)expectedResultClass;
@end
