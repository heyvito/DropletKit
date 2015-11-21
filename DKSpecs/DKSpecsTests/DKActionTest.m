//
//  DKActionTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKActionTest : XCTestCase

@end

@implementation DKActionTest

-(void)testShouldLoadDataFromJson {
    NSString* userData = @"{\"action\":{\"id\":36804636,\"status\":\"completed\",\"type\":\"create\",\"started_at\":\"2014-11-14T16:29:21Z\",\"completed_at\":\"2014-11-14T16:30:06Z\",\"resource_id\":3164444,\"resource_type\":\"droplet\",\"region\":\"nyc3\",\"region_slug\":\"nyc3\"}}";
    NSDate *started = [[NSDate RFC3339DateFormatter] dateFromString:@"2014-11-14T16:29:21Z"];
    NSDate *completed = [[NSDate RFC3339DateFormatter] dateFromString:@"2014-11-14T16:30:06Z"];
    NSData* data = [userData dataUsingEncoding:NSUTF8StringEncoding];
    DKAction* action = [[DKAction alloc] initWithJSON:data];
    XCTAssert([action.actionId isEqual:@36804636], @"actionId is not sane");
    XCTAssert([action.status isEqual:@"completed"], @"status in not sane");
    XCTAssert([action.type isEqual:@"create"], @"type is not sane");
    XCTAssert([action.startedAt isEqual:started], @"startedAt is not sane");
    XCTAssert([action.completedAt isEqual:completed], @"completedAt is not sane");
    XCTAssert([action.resourceId isEqual:@3164444], @"resourceId is not sane");
    XCTAssert([action.resourceType isEqual:@"droplet"], @"resourceType is not sane");
    XCTAssert([action.regionSlug isEqual:@"nyc3"], @"regionSlug is not sane");
}

@end