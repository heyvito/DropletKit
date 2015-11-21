//
//  DKDropletTest.m
//  DropletKit
//
//  Created by Victor Gama on 5/3/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <DropletKit/DropletKit.h>

@interface DKDropletTest : XCTestCase

@end

@implementation DKDropletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShouldLoadDataFromJson {
    NSString *rawData = @"{\"droplet\":{\"id\":1810260,\"name\":\"vm1\",\"memory\":512,\"vcpus\":1,\"disk\":20,\"locked\":false,\"status\":\"active\",\"kernel\":{\"id\":1221,\"name\":\"Ubuntu 14.04 x64 vmlinuz-3.13.0-24-generic (1221)\",\"version\":\"3.13.0-24-generic\"},\"created_at\":\"2014-06-08T17:31:41Z\",\"features\":[\"virtio\"],\"backup_ids\":[],\"next_backup_window\":null,\"snapshot_ids\":[],\"image\":{\"id\":3288841,\"name\":\"Dokku v0.2.3 on Ubuntu 14.04\",\"distribution\":\"Ubuntu\",\"slug\":null,\"public\":false,\"regions\":[\"nyc1\",\"ams1\",\"sfo1\",\"nyc2\",\"ams2\",\"sgp1\",\"lon1\",\"nyc3\",\"ams3\",\"fra1\"],\"created_at\":\"2014-04-23T17:35:14Z\",\"min_disk_size\":20,\"type\":\"snapshot\"},\"size\":{\"slug\":\"512mb\",\"memory\":512,\"vcpus\":1,\"disk\":20,\"transfer\":1,\"price_monthly\":5,\"price_hourly\":0.00744,\"regions\":[\"nyc1\",\"sgp1\",\"ams1\",\"sfo1\",\"nyc2\",\"lon1\",\"nyc3\",\"ams3\",\"ams2\",\"fra1\"],\"available\":true},\"size_slug\":\"512mb\",\"networks\":{\"v4\":[{\"ip_address\":\"108.150.49.55\",\"netmask\":\"255.255.255.0\",\"gateway\":\"108.150.49.1\",\"type\":\"public\"}],\"v6\":[]},\"region\":{\"name\":\"New York 2\",\"slug\":\"nyc2\",\"sizes\":[\"32gb\",\"16gb\",\"2gb\",\"1gb\",\"4gb\",\"8gb\",\"512mb\",\"64gb\",\"48gb\"],\"features\":[\"virtio\",\"private_networking\",\"backups\"],\"available\":true}}}";
    NSData *data = [rawData dataUsingEncoding:NSUTF8StringEncoding];
    DKDroplet *s = [[DKDroplet alloc] initWithJSON:data];
    
    NSDate *expectedCreated = [[NSDate RFC3339DateFormatter] dateFromString:@"2014-06-08T17:31:41Z"];
    NSSet *expectedFeatures = [NSSet setWithArray:@[@"virtio"]];
    NSSet *expectedImageRegions = [NSSet setWithArray:[@"nyc1,ams1,sfo1,nyc2,ams2,sgp1,lon1,nyc3,ams3,fra1" componentsSeparatedByString:@","]];
    NSDate *expectedImageCreated = [[NSDate RFC3339DateFormatter] dateFromString:@"2014-04-23T17:35:14Z"];
    NSSet *expectedSizeRegions = [NSSet setWithArray:[@"nyc1,ams1,sfo1,nyc2,ams2,sgp1,lon1,nyc3,ams3,fra1" componentsSeparatedByString:@","]];
    DKIPv4Network *network = nil;
    NSSet *expectedRegionFeatures = [NSSet setWithArray:[@"virtio,private_networking,backups" componentsSeparatedByString:@","]];
    NSSet *expectedRegionSizes = [NSSet setWithArray:[@"32gb,16gb,2gb,1gb,4gb,8gb,512mb,64gb,48gb" componentsSeparatedByString:@","]];

    
    XCTAssert([s.dropletId isEqual:@1810260], @"dropletId is not sane");
    XCTAssert([s.name isEqual:@"vm1"], @"name is not sane");
    XCTAssert([s.memory isEqual:@512], @"memory is not sane");
    XCTAssert([s.vCPUs isEqual:@1], @"vCPUs is not sane");
    XCTAssert([s.disk isEqual:@20], @"disk is not sane");
    XCTAssert(s.locked == NO, @"locked is not sane");
    XCTAssert([s.status isEqual:@"active"], "status is not sane");
    XCTAssert([s.kernel.kernelId isEqual:@1221], "kernel.kernelId is not sane");
    XCTAssert([s.kernel.name isEqual:@"Ubuntu 14.04 x64 vmlinuz-3.13.0-24-generic (1221)"], "kernel.name is not sane");
    XCTAssert([s.kernel.version isEqual:@"3.13.0-24-generic"], "kernel.version is not sane");
    XCTAssert([s.createdAt isEqual:expectedCreated], @"createdAt is not sane");
    XCTAssert([expectedFeatures intersectsSet:[NSSet setWithArray:s.features]], @"features is not sane");
    XCTAssert([s.backupIds count] == 0, @"backupIds is not sane");
    XCTAssert([s.snapshotIds count] == 0, @"snapshotIds is not sane");
    XCTAssert([s.image.imageId isEqual:@3288841], @"image.imageId is not sane");
    XCTAssert([s.image.name isEqual:@"Dokku v0.2.3 on Ubuntu 14.04"], @"image.name is not sane");
    XCTAssert([s.image.distribution isEqual:@"Ubuntu"], @"image.distribution is not sane");
    XCTAssert([s.image.slug isEqual:[NSNull null]], @"image.slug is not sane");
    XCTAssert(s.image.isPublic == NO, @"image.public is not sane");
    XCTAssert([expectedImageRegions intersectsSet:[NSSet setWithArray:s.image.regions]], @"image.regions is not sane");
    XCTAssert([s.image.createdAt isEqual:expectedImageCreated], @"image.createdAt is not sane");
    XCTAssert([s.image.minDiskSize isEqual:@20], @"image.minDiskSize is not sane");
    XCTAssert([s.image.type isEqual:@"snapshot"], @"image.type is not sane");
    XCTAssert([s.size.slug isEqual:@"512mb"], @"size.slug is not sane");
    XCTAssert([s.size.memory isEqual:@512], @"size.memory is not sane");
    XCTAssert([s.size.vCPUs isEqual:@1], @"size.vcpus is not sane");
    XCTAssert([s.size.disk isEqual:@20], @"size.disk is not sane");
    XCTAssert([s.size.transfer isEqual:@1.0], @"size.transfer is not sane");
    XCTAssert([s.size.priceMonthly isEqual:@5.0], @"size.priceMonthly is not sane");
    XCTAssert([s.size.priceHourly isEqual:@0.00744], @"size.priceHourly is not sane");
    XCTAssert(s.size.available == YES, @"size.available is not sane");
    XCTAssert([expectedSizeRegions intersectsSet:[NSSet setWithArray:s.size.regions]], @"size.regions is not sane");
    XCTAssert([s.sizeSlug isEqual:@"512mb"], "sizeSlug is not sane");
    XCTAssert([s.networks.ipv6Networks count] == 0, @"networks.ipv6Networks is not sane");
    XCTAssert([s.networks.ipv4Networks count] == 1, @"networks.ipv4Networks is not sane");
    network = s.networks.ipv4Networks[0];
    XCTAssert([network.ipAddress isEqual:@"108.150.49.55"], @"networks.ipv4Networks[0].ipAddress is not sane");
    XCTAssert([network.netmask isEqual:@"255.255.255.0"], @"networks.ipv4Networks[0].netmask is not sane");
    XCTAssert([network.gateway isEqual:@"108.150.49.1"], @"networks.ipv4Networks[0].gateway is not sane");
    XCTAssert([network.type isEqual:@"public"], @"networks.ipv4Networks[0].type is not sane");
    XCTAssert([s.region.name isEqual:@"New York 2"], @"region.name is not sane");
    XCTAssert([s.region.slug isEqual:@"nyc2"], @"region.slug is not sane");
    XCTAssert(s.region.available == YES, @"region.available is not sane");
    XCTAssert([expectedRegionFeatures intersectsSet:[NSSet setWithArray:s.region.features]], @"region.features is not sane");
    XCTAssert([expectedRegionSizes intersectsSet:[NSSet setWithArray:s.region.sizes]], @"region.sizes is not sane");
    if(s.hasNextBackupWindow) {
        XCTAssertNotNil(s.nextBackupWindow);
    } else {    
        XCTAssertNil(s.nextBackupWindow);
    }
}
@end
