//
//  MFConfig.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 3/6/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFCredentials.h"

@interface MFConfig : NSObject

@property(nonatomic) NSString* appId;
@property(nonatomic) NSString* apiKey;
@property(nonatomic) NSUInteger maxTokens;
@property(nonatomic) NSUInteger minTokens;

+ (void)createWithConfig:(NSDictionary*)config;
+ (MFConfig*)instance;
+ (void)destroy;
+ (Class)credentialsDelegate;
+ (Class)parallelRequestDelegate;
+ (Class)serialRequestDelegate;
+ (NSString*)defaultAPIVersion;
+ (BOOL)registerHTTPClient:(id)client withId:(NSString*)clientId;
+ (BOOL)unregisterHTTPClient:(NSString*)clientId;
+ (id)httpClientById:(NSString*)clientId;
+ (void)showNetworkIndicator;
+ (void)hideNetworkIndicator;
+ (NSURLSession*)defaultHttpClient;

@end
