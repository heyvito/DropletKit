//
//  DKDomainTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKDomainTest : XCTestCase

@end

@implementation DKDomainTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testShouldLoadDataFromJson {
    NSString* dataString = @"{\"domain\":{\"name\":\"digitaloceanisthebombdiggity.com\",\"ttl\":1800,\"zone_file\":null}}";
    NSData* data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    DKDomain* domain = [[DKDomain alloc] initWithJSON:data];
    XCTAssert([domain.name isEqualToString:@"digitaloceanisthebombdiggity.com"], @"name is not sane");
    XCTAssert([domain.ttl isEqual:@1800], @"ttl is not sane");
    XCTAssert([domain.zoneFile isEqual:[NSNull null]], @"zoneFile is not sane");
}

@end
