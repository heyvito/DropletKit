//
//  DKErrorDomain.m
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKErrorDomain : NSObject
+ (NSString *)domain;
- (NSString *)domain;

+ (NSError *)errorWithErrorCode:(NSInteger)errorCode;
+ (NSError *)errorWithErrorCode:(NSInteger)errorCode userInfo:(NSDictionary *)userInfo;
+ (NSError *)undefinedError;
+ (NSError *)inconsistentDataReceivedFromEndpoint;
+ (NSError *)unexpectedResponse;
+ (NSError *)inconsistentArgumentsWithReason:(NSString *)reason;
+ (NSError *)dropletLocked;
+ (NSError *)tokenExpired;
@end
