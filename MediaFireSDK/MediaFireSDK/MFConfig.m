//
//  MFConfig.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 3/6/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFConfig.h"
#import "MFErrorMessage.h"
#import "MFErrorLog.h"
#import "MFParallelRequestManagerDelegate.h"
#import "MFSerialRequestManagerDelegate.h"
#import "MFHTTPClientDelegate.h"
#import "MFCredentialsDelegate.h"
#import "MFNetworkIndicatorDelegate.h"

@interface MFConfig()

@property(nonatomic) Class<MFCredentialsDelegate>CredentialsDelegate;
@property(nonatomic) Class<MFSerialRequestManagerDelegate>SerialRequestDelegate;
@property(nonatomic) Class<MFParallelRequestManagerDelegate>ParallelRequestDelegate;
@property(nonatomic) id<MFNetworkIndicatorDelegate>NetworkIndicatorDelegate;
@property(strong, nonatomic) NSMutableDictionary* httpClients;
@property(strong, nonatomic) NSLock* opLock;
@property(strong, nonatomic) NSURLSession* defaultHttpClient;

@end

MFConfig* instance = nil;

@implementation MFConfig

NSString* const MFCONF_APPID            = @"app_id";
NSString* const MFCONF_APIKEY           = @"api_key";
NSString* const MFCONF_CREDS_DELEGATE   = @"credentials_delegate";
NSString* const MFCONF_PRM_DELEGATE     = @"prm_delegate";
NSString* const MFCONF_SRM_DELEGATE     = @"srm_delegate";
NSString* const MFCONF_MINTOKEN         = @"min_tokens";
NSString* const MFCONF_MAXTOKEN         = @"max_tokens";
NSString* const MFCONF_NETIND_DELEGATE  = @"netind_delegate";
NSString* const MFCONF_HTTPCLIENT       = @"httpclient_config";

//------------------------------------------------------------------------------
- (id)init {
    return [self initWithConfig:nil];
}

//------------------------------------------------------------------------------
- (id)initWithConfig:(NSDictionary*)config {
    BOOL instanceExists = false;
    @synchronized(self) {
        if (instance != nil) {
            instanceExists = true;
        }
    }
    if (instanceExists) {
        return instance;
    }
    
    if (config == nil) {
        erm(nullField:@"master config");
        return nil;
    }
    self = [super init];
    if ( self == nil ) {
        return nil;
    }
    
    _opLock = [[NSLock alloc] init];
    
    if (config[@"app_id"] == nil) {
        erm(nullField:@"application identification");
        return nil;
    }
    
    _appId = config[@"app_id"];
    _apiKey = config[@"api_key"];
    
    if (config[@"credentials_delegate"] != nil) {
        self.CredentialsDelegate = config[@"credentials_delegate"];
    }

    if (config[@"srm_delegate"] != nil) {
        self.SerialRequestDelegate = config[@"srm_delegate"];
    }

    if (config[@"prm_delegate"] != nil) {
        self.ParallelRequestDelegate = config[@"prm_delegate"];
    }

    if (config[@"netind_delegate"] != nil) {
        self.NetworkIndicatorDelegate = config[@"netind_delegate"];
    }
    
    if (config[@"max_tokens"] != nil) {
        NSUInteger max = [config[@"max_tokens"] unsignedIntegerValue];
        if (max > 0) {
            _maxTokens = max;
        }
    } else {
        _maxTokens = 10;
    }

    if (config[@"min_tokens"] != nil) {
        NSUInteger min = [config[@"min_tokens"] unsignedIntegerValue];
        if ((min < _maxTokens) && (min > 0)) {
            _minTokens = min;
        }
    } else {
        _minTokens = 3;
    }
    
    if (config[@"httpclient_config"] != nil) {
        _defaultHttpClient = [NSURLSession sessionWithConfiguration:config[@"httpclient_config"]];
    } 
    
    return self;
    
}

//------------------------------------------------------------------------------
+ (void)createWithConfig:(NSDictionary*)config {
    instance = [[MFConfig alloc] initWithConfig:config];
}

//------------------------------------------------------------------------------
+ (MFConfig*)instance {
    return instance;
}

//------------------------------------------------------------------------------
+ (void)destroy {
    [instance unregisterAllHTTPClients];
    @synchronized(self) {
        instance = nil;
    }
}

//------------------------------------------------------------------------------
+ (Class)credentialsDelegate {
    return [self.instance CredentialsDelegate];
}

//------------------------------------------------------------------------------
+ (Class)serialRequestDelegate {
    return [self.instance SerialRequestDelegate];
}

//------------------------------------------------------------------------------
+ (Class)parallelRequestDelegate {
    return [self.instance ParallelRequestDelegate];
}

//------------------------------------------------------------------------------
- (void)unregisterAllHTTPClients {
    NSMutableArray* httpClientIds = [[NSMutableArray alloc] init];
    [self.opLock lock];
    // first get the list of keys
    for (NSString* key in self.httpClients) {
        [httpClientIds addObject:key];
    }
    [self.opLock unlock];
    // individually remove the registered clients
    for (int i=0 ; i<httpClientIds.count ; i++) {
        [self unregisterHTTPClient:httpClientIds[i]];
    }
}

//------------------------------------------------------------------------------
- (BOOL)unregisterHTTPClient:(NSString*)clientId {
    BOOL result = true;
    [self.opLock lock];
    if (self.httpClients[clientId] != nil) {
        if ([self.httpClients[clientId] conformsToProtocol:@protocol(MFHTTPClientDelegate)]) {
            [self.httpClients[clientId] destroy];
        }
        [self.httpClients removeObjectForKey:clientId];
    } else {
        mflog(@"An HTTP Client was not registered.");
        result = false;
    }
    [self.opLock unlock];
    return result;
}

//------------------------------------------------------------------------------
+ (BOOL)unregisterHTTPClient:(NSString*)clientId {
    return [instance unregisterHTTPClient:clientId];
}

//------------------------------------------------------------------------------
- (BOOL)registerHTTPClient:(id)client withId:(NSString*)clientId {
    if (!clientId.length) {
        erm(nullField:@"HTTP Client ID");
        return false;
    }
    if (![client conformsToProtocol:@protocol(MFHTTPClientDelegate)]) {
        erm(invalidField:@"HTTP Client");
        return false;
    }
    BOOL result = true;
    [self.opLock lock];
    if (self.httpClients == nil) {
        self.httpClients = [[NSMutableDictionary alloc] init];
    }
    if (self.httpClients[clientId] != nil) {
        result = false;
    } else {
        self.httpClients[clientId] = client;
    }
    [self.opLock unlock];
    return result;
}

//------------------------------------------------------------------------------
+ (BOOL)registerHTTPClient:(id)client withId:(NSString*)clientId {
    return [instance registerHTTPClient:client withId:clientId];
}

//------------------------------------------------------------------------------
- (id)httpClientById:(NSString*)clientId {
    id client = nil;
    [self.opLock lock];
    client = self.httpClients[clientId];
    [self.opLock unlock];
    return client;
}

//------------------------------------------------------------------------------
+ (id)httpClientById:(NSString*)clientId {
    return [instance httpClientById:clientId];
}

//------------------------------------------------------------------------------
+ (NSString*)defaultAPIVersion {
    return @"1.0";
}

+ (void)showNetworkIndicator {
    if (instance.NetworkIndicatorDelegate) {
        [instance.NetworkIndicatorDelegate showNetworkIndicator];
    }
}

+ (void)hideNetworkIndicator {
    if (instance.NetworkIndicatorDelegate) {
        [instance.NetworkIndicatorDelegate hideNetworkIndicator];
    }
}

//------------------------------------------------------------------------------
+ (NSURLSession*)defaultHttpClient {
    if (instance.defaultHttpClient != nil) {
        return instance.defaultHttpClient;
    } else {
        return [NSURLSession sharedSession];
    }
}

@end
