//
//  DKBaseModel.m
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"
#import "DKClient.h"

@implementation DKBaseModel {
    NSDictionary *initialDictionary;
}

- (instancetype)initWithJSON:(NSData *)data {
    self = [super init];
    if(data == nil) {
        self = nil;
    } else {
        NSError *error = nil;
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if(error != nil) {
            self = nil;
        } else {
            if([object isKindOfClass:[NSDictionary class]]) {
                NSDictionary *data = object;
                self = [self initWithDictionary:data];
            } else {
                self = nil;
            }
        }
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)data {
    if(self = [super init]) {
        initialDictionary = data;
        [self fillInstanceWithDictionary:data];
    }
    return self;
}

- (void)fillInstanceWithDictionary:(NSDictionary *)data {
    [self doesNotRecognizeSelector:_cmd];
}

+ (BOOL)checkData:(NSDictionary const *)dict contains:(NSString *)keysSeparatedByCommas {
    if (!dict || [dict isEqual:[NSNull null]]) {
        return NO;
    }
    NSMutableArray *expectedKeys = [NSMutableArray array];
    NSArray *rawExpectedKeys = [keysSeparatedByCommas componentsSeparatedByString:@","];
    for(NSString *string in rawExpectedKeys) {
        [expectedKeys addObject:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    }
    
    NSSet *expectedSet = [[NSSet alloc] initWithArray:expectedKeys];
    NSSet *dictSet = [[NSSet alloc] initWithArray:[dict allKeys]];
    return [dictSet intersectsSet:expectedSet];
}

- (NSString *)actionsURLWithAPIInstance:(DKClient *)instance {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (PMKPromise *)runAction:(NSString *)action {
    return [self runAction:action withData:@{}];
}

- (PMKPromise *)runAction:(NSString *)action withData:(NSDictionary *)dict {
    DKClient *instance = [DKClient sharedInstance];
    return [instance requestAction:action forUrl:[self actionsURLWithAPIInstance:instance] andData:dict];
}

// MARK: NSCopying protocol

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithDictionary:initialDictionary];
}

@end
