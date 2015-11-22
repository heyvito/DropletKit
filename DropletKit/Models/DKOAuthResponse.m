//
//  DKOAuthResponse.m
//  DropletKit
//
//  Created by Victor Gama on 11/21/15.
//  Copyright © 2015 Hexic Labs. All rights reserved.
//

#import "DKOAuthResponse.h"

@implementation DKOAuthResponse
- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(!CHECK_DATA_CONTAINS(access_token, token_type, expires_in, refresh_token, scope)) {
        self = nil;
    } else {
        EXPAND_DATA_LOCAL(access_token, accessToken)
        EXPAND_DATA_LOCAL(token_type, tokenType)
        EXPAND_DATA_LOCAL(refresh_token, refreshToken)
        EXPAND_DATA(scope)
        self.expires = [NSDate dateWithTimeIntervalSinceNow:[data[@"expires_in"] longValue]];
    }
    return self;
}
@end
