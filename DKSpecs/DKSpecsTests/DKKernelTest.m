//
//  DKKernelTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKKernelTest : XCTestCase

@end

@implementation DKKernelTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testShouldLoadDataFromJson {
    NSString *rawData = @"{\"id\":2233,\"name\":\"Ubuntu 14.04 x64 vmlinuz-3.13.0-37-generic\",\"version\":\"3.13.0-37-generic\"}";
    NSData *data = [rawData dataUsingEncoding:NSUTF8StringEncoding];
    DKKernel *k = [[DKKernel alloc] initWithJSON:data];
    XCTAssert([k.kernelId isEqual:@2233], @"kernelID is not sane");
    XCTAssert([k.name isEqual:@"Ubuntu 14.04 x64 vmlinuz-3.13.0-37-generic"], @"name is not sane");
    XCTAssert([k.version isEqual:@"3.13.0-37-generic"], @"version is not sane");
}

@end
