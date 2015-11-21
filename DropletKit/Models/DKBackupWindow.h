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

/**
 *  Date and time when the next Backup Window begins.
 */
@property NSDate *windowStart;

/**
 *  Date and time when the next Backup Window finishes.
 */
@property NSDate *windowEnd;

@end
