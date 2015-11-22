//
//  DKOAuthResponse.h
//  DropletKit
//
//  Created by Victor Gama on 11/21/15.
//  Copyright © 2015 Hexic Labs. All rights reserved.
//

#import <DropletKit/DropletKit.h>


/**
 *  Represents an OAuth response for a Token or Refresh token
 *  exchange
 */
@interface DKOAuthResponse : DKBaseModel

/**
 *  Access token string used to further authentication.
 */
@property NSString *accessToken;

/**
 *  Kind of token received from the authorizaiton server.
 */
@property NSString *tokenType;

/**
 *  Date of expiration of the received access token.
 */
@property NSDate *expires;

/**
 *  Refresh token string used to exchange for a new Access
 *  Token upon the current token's expiration.
 */
@property NSString *refreshToken;

/**
 *  Scopes available for the received token.
 */
@property NSString *scope;

@end
