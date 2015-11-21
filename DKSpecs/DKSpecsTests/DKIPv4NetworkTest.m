//
//  DKIPv4NetworkTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKIPv4NetworkTest : XCTestCase

@end

@implementation DKIPv4NetworkTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShouldLoadDataFromJson {
    NSString* rawData = @"{\"ip_address\":\"104.236.32.182\",\"netmask\":\"255.255.192.0\",\"gateway\":\"104.236.0.1\",\"type\":\"public\"}";
    NSData *data = [rawData dataUsingEncoding:NSUTF8StringEncoding];
    DKIPv4Network *s = [[DKIPv4Network alloc] initWithJSON:data];
    
    XCTAssert([s.ipAddress isEqual:@"104.236.32.182"], @"ipAddress is not sane");
    XCTAssert([s.netmask isEqual:@"255.255.192.0"], @"netmask is not sane");
    XCTAssert([s.gateway isEqual:@"104.236.0.1"], @"gateway is not sane");
    XCTAssert([s.type isEqual:@"public"], @"type is not sane");

}

@end
