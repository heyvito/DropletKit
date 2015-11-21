//
//  Constants.h
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#ifndef DropletKit_Header_h
#define DropletKit_Header_h

#define kAPIERRDOMAIN @"io.vito.DropletKit"
#define kDOBASEAPIURL @"https://api.digitalocean.com/v2/"

typedef enum {
    DKErrorCode_Undefined = 0,
    DKErrorCode_InconsistentDataReceivedFromEndpoint,
    DKErrorCode_UnexpectedResponse,
    DKErrorCode_InconsistentArguments,
    DKErrorCode_DropletLocked,
} DKErrorCode;

typedef enum {
    DKDomainRecordType_A = 0,
    DKDomainRecordType_AAAA,
    DKDomainRecordType_CNAME,
    DKDomainRecordType_MX,
    DKDomainRecordType_TXT,
    DKDomainRecordType_SRV,
    DKDomainRecordType_NS
} DKDomainRecordType;

#define DKDomainRecordTypeValue(enum) [@[ @"A", @"AAAA", @"CNAME", @"MX", @"TXT", @"SRV", @"NS" ] objectAtIndex:enum]

#endif
