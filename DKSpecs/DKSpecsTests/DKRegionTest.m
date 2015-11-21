//
//  DKRegionTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKRegionTest : XCTestCase

@end

@implementation DKRegionTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShouldLoadDataFromJson {
    NSString* rawData = @"{\"name\":\"New York 2\",\"slug\":\"nyc2\",\"sizes\":[\"32gb\",\"16gb\",\"2gb\",\"1gb\",\"4gb\",\"8gb\",\"512mb\",\"64gb\",\"48gb\"],\"features\":[\"virtio\",\"private_networking\",\"backups\"],\"available\":true}";
    NSData *data = [rawData dataUsingEncoding:NSUTF8StringEncoding];
    DKRegion *s = [[DKRegion alloc] initWithJSON:data];
    NSSet *expectedSizes = [NSSet setWithArray:[@"32gb,16gb,2gb,1gb,4gb,8gb,512mb,64gb,48gb" componentsSeparatedByString:@","]];
    NSSet *expectedFeatures = [NSSet setWithArray:[@"irtio,private_networking,backups" componentsSeparatedByString:@","]];
    
    XCTAssert([s.name isEqual:@"New York 2"], @"name is not sane");
    XCTAssert([s.slug isEqual:@"nyc2"], @"slug is not sane");
    XCTAssert(s.available == YES, @"available is not sane");
    
    XCTAssert([expectedSizes intersectsSet:[NSSet setWithArray:s.sizes]], @"sizes array is not sane");
    XCTAssert([expectedFeatures intersectsSet:[NSSet setWithArray:s.features]], @"features array is not sane");
    
    
}

@end
