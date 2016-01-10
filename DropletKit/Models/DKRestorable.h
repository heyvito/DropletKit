//
//  DKRestorable.h
//  DropletKit
//
//  Created by Victor Gama on 10/01/2016.
//  Copyright © 2016 Hexic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DKRestorable <NSObject>

/**
 *  Returns the image restoration ID associated with this item
 *
 *  @return Image restoration ID
 */
- (NSNumber *)restorableId;

/**
 *  Returns the image restoration ID associated with this item
 *
 *  @return Image restoragion slug
 */
- (NSString *)restorableSlug;

@end
