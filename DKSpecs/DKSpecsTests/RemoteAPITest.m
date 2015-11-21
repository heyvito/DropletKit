//
//  RemoteAPITest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

//#define DisableRemoteTests

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface RemoteAPITest : XCTestCase

@end

@implementation RemoteAPITest

- (void)setUp {
    [super setUp];
//    [DKClient setAuthenticationToken:@"YOUR DO TOKEN HERE"];
    [DKClient setAuthenticationToken:@"3b7bff2397d42d35baf68bbc2471a066b865f4962e1ce9fbd1a8ac428cd1dbff"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#ifndef DisableRemoteTests

- (void)testAccountEndpoint {
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"Expectations"];
    [[DKClient sharedInstance] getAccountInfo].then(^(DKUser *user) {
        NSLog(@"Received DOUser: %@", user.email);
        [expectation fulfill];
    })
    .catch(^(void){
        XCTFail(@"Received an error from the remote endpoint");
    });
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

-(void)testDropletsEndpoint {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Expectation"];
    [[DKClient sharedInstance] getDroplets].then(^(DKDropletCollection *collection) {
        NSLog(@"Received %@ droplets", collection.totalObjects);
        [expectation fulfill];
    }).catch(^(NSError *error){
        XCTFail(@"Received an error from the remote endpoint: %@", error);
    });
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

-(void)testActionEndpoint {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Expectation"];
    [[DKClient sharedInstance] getActions].then(^(DKActionCollection *collection) {
        NSLog(@"Received %@ actions", collection.totalObjects);
        if([collection hasNextPage]) {
            [collection fetchNextPage].then(^(DKActionCollection *collection) {
                [expectation fulfill];
            });
        } else {
            [expectation fulfill];
        }
    }).catch(^(void){
        XCTFail(@"Received an error from the remote endpoint");
    });
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

-(void)testDomainsEndpoint {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Expectation"];
    [[DKClient sharedInstance] getDomains].then(^(DKDomainCollection *collection) {
        NSLog(@"Received %@ domains", collection.totalObjects);
        [expectation fulfill];
    }).catch(^(void){
        XCTFail(@"Received an error from the remote endpoint");
    });
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

-(void)testDomainRecordsEndpoint {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Expectation"];
    [[DKClient sharedInstance] getDomains].then(^(DKDomainCollection *collection) {
        NSLog(@"Received %@ domains", collection.totalObjects);
        DKDomain *d = collection.objects[0];
        [d domainRecords].then(^(DKDomainRecordCollection *records) {
            NSLog(@"Received %@ records", records.totalObjects);
            if(records.totalObjects > 0) {
                DKDomainRecord* record = records.objects[0];
                XCTAssertEqual(record.parentDomain, d);
            }
            [expectation fulfill];
        });
    }).catch(^(void){
        XCTFail(@"Received an error from the remote endpoint");
    });
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

-(void)testKeysEndpoint {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Expectation"];
    [[DKClient sharedInstance] getSSHKeys].then(^(DKSSHKeyCollection *collection) {
        NSLog(@"Received %@ keys", collection.totalObjects);
        [expectation fulfill];
    }).catch(^(void){
        XCTFail(@"Received an error from the remote endpoint");
    });
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

-(void)testImagesEndpoint {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Expectation"];
    [[DKClient sharedInstance] getImages].then(^(DKImageCollection *collection) {
        NSLog(@"Received %@ images", collection.totalObjects);
        [expectation fulfill];
    }).catch(^(void){
        XCTFail(@"Received an error from the remote endpoint");
    });
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

-(void)testRegionsEndpoint {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Expectation"];
    [[DKClient sharedInstance] getRegions].then(^(DKRegionCollection *collection) {
        NSLog(@"Received %@ regions", collection.totalObjects);
        [expectation fulfill];
    }).catch(^(void){
        XCTFail(@"Received an error from the remote endpoint");
    });
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

-(void)testSizesEndpoint {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Expectation"];
    [[DKClient sharedInstance] getSizes].then(^(DKSizeCollection *collection) {
        NSLog(@"Received %@ sizes", collection.totalObjects);
        [expectation fulfill];
    }).catch(^(void){
        XCTFail(@"Received an error from the remote endpoint");
    });
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

#endif

@end
