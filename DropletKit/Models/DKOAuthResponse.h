//
//  DKOAuthResponse.h
//  DropletKit
//
//  Created by Victor Gama on 11/21/15.
//  Copyright © 2015 Hexic Labs. All rights reserved.
//

#import <DropletKit/DropletKit.h>

@interface DKOAuthResponse : DKBaseModel

@property NSString *accessToken;
@property NSString *tokenType;
@property NSDate *expires;
@property NSString *refreshToken;
@property NSString *scope;

@end
