//
//  MFHTTPClient.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 5/30/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFHTTPClientDelegate.h"

@class MFHTTPData;
@class MFURLRequestConfig;

typedef void (^OperationBlock)(id response, NSInteger status, NSDictionary * downloaded);


@interface MFHTTPClient : NSObject <NSURLSessionDelegate,NSURLSessionTaskDelegate,MFHTTPClientDelegate>
@property(strong,nonatomic)NSURLSession* session;
@property(strong,nonatomic)NSMutableDictionary* appRequestData;
@property int64_t counter;
@property(strong,nonatomic)NSLock* opLock;
@property(strong,nonatomic)NSString* defaultMethod;

- (id)initWithConfig:(NSURLSessionConfiguration*)config;
- (void)addRequest:(MFURLRequestConfig*)config;
- (MFHTTPData*)getAppRequestDataForTask:(NSURLSessionTask*)task;
- (MFHTTPData*)removeAppRequestDataForTask:(NSURLSessionTask*)task;
- (id)constructTaskWithRequest:(NSMutableURLRequest*)request config:(MFURLRequestConfig*)config;
- (void)destroy;

@end
