//
//  DKUserDataTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/2/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKUserTest : XCTestCase
@end

@implementation DKUserTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

-(void)testShouldReturnNilWithInvalidJson {
    NSString* userData = @"invalid json?>";
    NSData* invalidData = [userData dataUsingEncoding:NSUTF8StringEncoding];
    DKUser* user = [[DKUser alloc] initWithJSON:invalidData];
    XCTAssert(user == nil, @"Pass");
}

-(void)testShouldReturnNilWithIncompatibleJson {
    NSString* userData = @"[1,2,3]";
    NSData* invalidData = [userData dataUsingEncoding:NSUTF8StringEncoding];
    DKUser* user = [[DKUser alloc] initWithJSON:invalidData];
    XCTAssert(user == nil, @"Pass");
}

-(void)testShouldLoadDataFromJson {
    NSString* userData = @"{\"account\":{\"droplet_limit\":25,\"email\":\"sammy@digitalocean.com\",\"uuid\":\"b6fr89dbf6d9156cace5f3c78dc9851d957381ef\",\"email_verified\":true,\"name\":10}}";
    NSData* data = [userData dataUsingEncoding:NSUTF8StringEncoding];
    DKUser* user = [[DKUser alloc] initWithJSON:data];
    XCTAssert([user.dropletLimit isEqual:@25], @"dropletLimit is not sane");
    XCTAssert([user.email isEqualToString:@"sammy@digitalocean.com"], @"email is not sane");
    XCTAssert([user.uuid isEqualToString:@"b6fr89dbf6d9156cace5f3c78dc9851d957381ef"], "uuid is not sane");
    XCTAssert(user.emailVerified == YES, "emailVerified is not same");
}

@end
