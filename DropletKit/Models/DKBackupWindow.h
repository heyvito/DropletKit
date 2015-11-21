//
//  DKBackupWindow.h
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import "DKBaseModel.h"

@interface DKBackupWindow : DKBaseModel
#pragma mark Extended properties
@property NSDate *windowStart;
@property NSDate *windowEnd;
@end
