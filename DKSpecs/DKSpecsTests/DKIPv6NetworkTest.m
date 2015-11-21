//
//  DKIPv6NetworkTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKIPv6NetworkTest : XCTestCase

@end

@implementation DKIPv6NetworkTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShouldLoadDataFromJson {
    NSString* rawData = @"{\"ip_address\":\"2604:A880:0800:0010:0000:0000:02DD:4001\",\"netmask\":64,\"gateway\":\"2604:A880:0800:0010:0000:0000:0000:0001\",\"type\":\"public\"}";
    NSData *data = [rawData dataUsingEncoding:NSUTF8StringEncoding];
    DKIPv6Network *s = [[DKIPv6Network alloc] initWithJSON:data];
    
    XCTAssert([s.ipAddress isEqual:@"2604:A880:0800:0010:0000:0000:02DD:4001"], @"ipAddress is not sane");
    XCTAssert([s.netmask isEqual:@64], @"netmask is not sane");
    XCTAssert([s.gateway isEqual:@"2604:A880:0800:0010:0000:0000:0000:0001"], @"gateway is not sane");
    XCTAssert([s.type isEqual:@"public"], @"type is not sane");
    
}

@end
