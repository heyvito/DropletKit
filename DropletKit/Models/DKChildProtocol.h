//
//  DKChildProtocol.h
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DKChildProtocol <NSObject>
@required
- (void)setParent:(id)parent;
@end
