//
//  DKSizeTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKSizeTest : XCTestCase

@end

@implementation DKSizeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShouldLoadDataFromJson {
    NSString* rawData = @"{\"slug\":\"512mb\",\"memory\":512,\"vcpus\":1,\"disk\":20,\"transfer\":1,\"price_monthly\":5,\"price_hourly\":0.00744,\"regions\":[\"nyc1\",\"sgp1\",\"ams1\",\"sfo1\",\"nyc2\",\"lon1\",\"nyc3\",\"ams3\",\"ams2\",\"fra1\"],\"available\":true}";
    NSSet *expectedRegions = [NSSet setWithArray:[@"nyc1,sgp1,ams1,sfo1,nyc2,lon1,nyc3,ams3,ams2,fra1" componentsSeparatedByString:@","]];
    NSData *data = [rawData dataUsingEncoding:NSUTF8StringEncoding];
    DKSize *s = [[DKSize alloc] initWithJSON:data];
    
    
    XCTAssert([s.slug isEqual:@"512mb"], @"slug is not sane");
    XCTAssert([s.memory isEqual:@512], @"memory is not sane");
    XCTAssert([s.disk isEqual:@20], @"disk is not sane");
    XCTAssert([s.transfer isEqual:@1], @"transfer is not sane");
    XCTAssert([s.priceMonthly isEqual:@5], @"priceMonthly is not sane");
    XCTAssert([s.priceHourly isEqual:@0.00744], @"priceHourly is not sane");
    XCTAssert(s.available == YES, @"available is not sane");
    XCTAssert([expectedRegions intersectsSet:[NSSet setWithArray:s.regions]], @"regions is not sane");
}

@end
