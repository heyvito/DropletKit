//
//  Macros.h
//  DropletKit
//
//  Created by Victor Gama on 5/6/15.
//  Copyright (c) 2015 Victor Gama. All rights reserved.
//

#ifndef DropletKit_Macros_h
#define DropletKit_Macros_h

#pragma mark Dictionary Expansion Macros
#define EXPAND_DATA_DATE_LOCAL(name, local) self.local = [[NSDate RFC3339DateFormatter] dateFromString:[data objectForKey:@#name]];
#define EXPAND_DATA_LOCAL(name, local) self.local = [data objectForKey:@#name];
#define EXPAND_DATA(name) self.name = [data objectForKey:@#name];
#define EXPAND_DATA_DATE(name) self.name = [[NSDate RFC3339DateFormatter] dateFromString:[data objectForKey:@#name]];
#define EXPAND_DICT(dict, name) self.name = [dict objectForKey:@#name];
#define EXPAND_DICT_LOCAL(dict, name, local) self.local = [dict objectForKey:@#name];
#define EXPAND_DICT_LOCAL_BOOL(dict, name, local) self.local = [[dict objectForKey:@#name] boolValue];

#define CHECK_DATA_CONTAINS(...) [DKBaseModel checkData:data contains:@#__VA_ARGS__]


#pragma mark Utility Macros
#define _GET_NTH_ARG(_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16, _17, _18, _19, _20, _21, _22, _23, _24, _25, _26, _27, _28, _29, N, ...) N
#define _fe_0(_call, ...)
#define _fe_1(_call, x) _call(x)
#define _fe_2(_call, x, ...) _call(x) _fe_1(_call, __VA_ARGS__)
#define _fe_3(_call, x, ...) _call(x) _fe_2(_call, __VA_ARGS__)
#define _fe_4(_call, x, ...) _call(x) _fe_3(_call, __VA_ARGS__)
#define _fe_5(_call, x, ...) _call(x) _fe_4(_call, __VA_ARGS__)
#define _fe_6(_call, x, ...) _call(x) _fe_5(_call, __VA_ARGS__)
#define _fe_7(_call, x, ...) _call(x) _fe_6(_call, __VA_ARGS__)
#define _fe_8(_call, x, ...) _call(x) _fe_7(_call, __VA_ARGS__)
#define _fe_9(_call, x, ...) _call(x) _fe_8(_call, __VA_ARGS__)
#define _fe_10(_call, x, ...) _call(x) _fe_9(_call, __VA_ARGS__)
#define _fe_11(_call, x, ...) _call(x) _fe_10(_call, __VA_ARGS__)
#define _fe_12(_call, x, ...) _call(x) _fe_11(_call, __VA_ARGS__)
#define _fe_13(_call, x, ...) _call(x) _fe_12(_call, __VA_ARGS__)
#define _fe_14(_call, x, ...) _call(x) _fe_13(_call, __VA_ARGS__)
#define _fe_15(_call, x, ...) _call(x) _fe_14(_call, __VA_ARGS__)
#define _fe_16(_call, x, ...) _call(x) _fe_15(_call, __VA_ARGS__)
#define _fe_17(_call, x, ...) _call(x) _fe_16(_call, __VA_ARGS__)
#define _fe_18(_call, x, ...) _call(x) _fe_17(_call, __VA_ARGS__)
#define _fe_19(_call, x, ...) _call(x) _fe_18(_call, __VA_ARGS__)
#define _fe_20(_call, x, ...) _call(x) _fe_19(_call, __VA_ARGS__)
#define _fe_21(_call, x, ...) _call(x) _fe_20(_call, __VA_ARGS__)
#define _fe_22(_call, x, ...) _call(x) _fe_21(_call, __VA_ARGS__)
#define _fe_23(_call, x, ...) _call(x) _fe_22(_call, __VA_ARGS__)
#define _fe_24(_call, x, ...) _call(x) _fe_23(_call, __VA_ARGS__)
#define _fe_25(_call, x, ...) _call(x) _fe_24(_call, __VA_ARGS__)
#define _fe_26(_call, x, ...) _call(x) _fe_25(_call, __VA_ARGS__)
#define _fe_27(_call, x, ...) _call(x) _fe_26(_call, __VA_ARGS__)
#define _fe_28(_call, x, ...) _call(x) _fe_27(_call, __VA_ARGS__)
#define CALL_MACRO_X_FOR_EACH(x, ...) \
_GET_NTH_ARG("ignored", ##__VA_ARGS__, \
_fe_28, _fe_27, _fe_26, _fe_25, _fe_24, _fe_23, _fe_22, _fe_21, _fe_20, _fe_19, _fe_18, _fe_17, _fe_16, _fe_15, _fe_14, _fe_13, _fe_12, _fe_11, _fe_10, _fe_9, _fe_8, _fe_7, _fe_6, _fe_5, _fe_4, _fe_3, _fe_2, _fe_1, _fe_0)(x, ##__VA_ARGS__)

#endif
