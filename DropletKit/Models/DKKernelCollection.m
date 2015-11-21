//
//  DKKernelCollection.m
//  DropletKit
//
//  Created by Victor Gama on 5/7/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKKernelCollection.h"
#import "DropletKit.h"

@implementation DKKernelCollection
- (NSString *)expectedArrayKey {
    return @"kernels";
}
- (Class)expectedResultClass {
    return [DKKernel class];
}
@end
