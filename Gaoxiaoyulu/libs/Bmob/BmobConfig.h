//
//  BmobConfig.h
//  BmobSDK
//
//  Created by donson on 13-8-3.
//  Copyright (c) 2013年 donson. All rights reserved.
//


#import <Foundation/Foundation.h>
@class BmobObject;
@class BmobGeoPoint;
@class BmobUser;

#ifndef BmobSDK_BmobConfig_h
#define BmobSDK_BmobConfig_h

typedef enum {
    kBmobCachePolicyIgnoreCache = 0,    //
    kBmobCachePolicyCacheOnly,          //
    kBmobCachePolicyNetworkOnly,        //
    kBmobCachePolicyCacheElseNetwork,   //
    kBmobCachePolicyNetworkElseCache,   //
    kBmobCachePolicyCacheThenNetwork    //
} BmobCachePolicy;



typedef void (^BmobObjectResultBlock)(BmobObject *object, BOOL isSuccessful);
typedef void (^BmobObjectArrayResultBlock)(NSArray *array, BOOL isSuccessful);
typedef void (^BmobGeoPointBlock)(BmobGeoPoint *geoPoint, BOOL isSuccessful);
typedef void (^BmobBooleanResultBlock) (BOOL isSuccessful);
typedef void (^BmobIntegerResultBlock)(int number, BOOL isSuccessful) ;
typedef void (^BmobUserResultBlock)(BmobUser *user, BOOL isSuccessful);

#endif
