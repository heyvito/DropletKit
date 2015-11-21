//
//  DKDomainRecordTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKDomainRecordTest : XCTestCase

@end

@implementation DKDomainRecordTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testShouldLoadDataFromJson {
    NSString* rawData = @"{\"domain_record\":{\"id\":3352896,\"type\":\"A\",\"name\":\"customdomainrecord.com\",\"data\":\"162.10.66.0\",\"priority\":null,\"port\":null,\"weight\":null}}";
    NSData* data = [rawData dataUsingEncoding:NSUTF8StringEncoding];
    DKDomainRecord* record = [[DKDomainRecord alloc] initWithJSON:data];
    XCTAssert([record.recordId isEqual:@3352896], @"recordID is not sane");
    XCTAssert([record.type isEqual:@"A"], @"type is not sane");
    XCTAssert([record.name isEqual:@"customdomainrecord.com"], @"name is not sane");
    XCTAssert([record.recordData isEqual:@"162.10.66.0"], @"recordData is not sane");
    XCTAssert([record.priority isEqual:[NSNull null]], @"priority is not sane");
    XCTAssert([record.port isEqual:[NSNull null]], @"port is not sane");
    XCTAssert([record.weight isEqual:[NSNull null]], @"weight is not sane");
}

@end
