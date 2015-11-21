//
//  DKSSHKeyTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKSSHKeyTest : XCTestCase

@end

@implementation DKSSHKeyTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
-(void)testShouldLoadDataFromJson {
    NSString* keyData = @"{\"ssh_key\":{\"id\":512190,\"fingerprint\":\"3b:16:bf:e4:8b:00:8b:b8:59:8c:a9:d3:f0:19:45:fa\",\"public_key\":\"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAQQDDHr/jh2Jy4yALcK4JyWbVkPRaWmhck3IgCoeOO3z1e2dBowLh64QAM+Qb72pxekALga2oi4GvT+TlWNhzPH4V example\",\"name\":\"My SSH Public Key\"}}";
    NSData* data = [keyData dataUsingEncoding:NSUTF8StringEncoding];
    DKSSHKey* key = [[DKSSHKey alloc] initWithJSON:data];
    XCTAssert([key.name isEqual:@"My SSH Public Key"], @"name is not sane");
    XCTAssert([key.sshKeyId isEqual:@512190], @"sshKeyId is not sane");
    XCTAssert([key.fingerprint isEqualToString:@"3b:16:bf:e4:8b:00:8b:b8:59:8c:a9:d3:f0:19:45:fa"], "fingerprint is not sane");
    XCTAssert([key.publicKey isEqual:@"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAQQDDHr/jh2Jy4yALcK4JyWbVkPRaWmhck3IgCoeOO3z1e2dBowLh64QAM+Qb72pxekALga2oi4GvT+TlWNhzPH4V example"], "publicKey is not same");
}

@end
