//
//  DKImageTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKImageTest : XCTestCase

@end

@implementation DKImageTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShouldLoadDataFromJson {
    NSString *rawData = @"{\"id\":6918990,\"name\":\"14.04 x64\",\"distribution\":\"Ubuntu\",\"slug\":\"ubuntu-14-04-x64\",\"public\":true,\"regions\":[\"nyc1\",\"ams1\",\"sfo1\",\"nyc2\",\"ams2\",\"sgp1\",\"lon1\",\"nyc3\",\"ams3\",\"nyc3\"],\"created_at\":\"2014-10-17T20:24:33Z\",\"type\":\"snapshot\",\"min_disk_size\":20}";
    NSData *data = [rawData dataUsingEncoding:NSUTF8StringEncoding];
    DKImage *image = [[DKImage alloc]initWithJSON:data];
    
    NSArray* expectedRegionsArray = [[NSArray alloc] initWithObjects:@"nyc1", @"ams1", @"sfo1", @"nyc2", @"ams2", @"sgp1", @"lon1", @"nyc3", @"ams3", @"nyc3", nil];
    NSSet* expectedRegionsSet = [[NSSet alloc] initWithArray:expectedRegionsArray];
    NSDate* expectedCreationDate = [[NSDate RFC3339DateFormatter] dateFromString:@"2014-10-17T20:24:33Z"];
    
    XCTAssert([image.imageId isEqual:@6918990], @"imageId is not sane");
    XCTAssert([image.name isEqual:@"14.04 x64"], @"name is not sane");
    XCTAssert([image.distribution isEqual:@"Ubuntu"], @"distribution is not sane");
    XCTAssert([image.slug isEqual:@"ubuntu-14-04-x64"], @"slug is not sane");
    XCTAssert(image.isPublic == YES, @"isPublic is not sane");
    NSSet* imageRegionsSet = [[NSSet alloc] initWithArray:image.regions];
    XCTAssert([expectedRegionsSet intersectsSet:imageRegionsSet], @"regions is not sane");
    XCTAssert([image.createdAt isEqual:expectedCreationDate], @"createdAt is not sane");
    XCTAssert([image.type isEqual:@"snapshot"], @"type is not sane");
    XCTAssert([image.minDiskSize isEqual:@20], @"minDiskSize is not sane");
}

@end
