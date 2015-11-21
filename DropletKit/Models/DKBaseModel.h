//
//  DKBaseModel.h
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMKPromise, DKClient;

@interface DKBaseModel : NSObject
- (instancetype)initWithJSON:(NSData *)data;
- (instancetype)initWithDictionary:(NSDictionary *)data;

+ (BOOL)checkData:(NSDictionary const *)dict contains:(NSString *)keysSeparatedByCommas;

- (NSString *)actionsURLWithAPIInstance:(DKClient *)instance;
- (PMKPromise *)runAction:(NSString *)action;
- (PMKPromise *)runAction:(NSString *)action withData:(NSDictionary *)dict;
@end
