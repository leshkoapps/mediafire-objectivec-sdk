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
#import "MediaFireSDK.h"


@interface MFConfig(){
    __weak MediaFireSDK *_sdk;
}

@property (nonatomic) Class<MFSerialRequestManagerDelegate>SerialRequestDelegateClass;
@property (nonatomic) Class<MFParallelRequestManagerDelegate>ParallelRequestDelegateClass;
@property (nonatomic,strong) id<MFCredentialsDelegate>CredentialsDelegate;
@property (nonatomic,strong) id<MFNetworkIndicatorDelegate>NetworkIndicatorDelegate;
@property (strong, nonatomic) NSMutableDictionary* httpClients;
@property (strong, nonatomic) NSLock* opLock;
@property (strong, nonatomic) NSURLSession* defaultHttpClientObj;
@property (strong, nonatomic) NSString* defaultAPIVersion;
@property (strong, nonatomic) NSDictionary* defaultAPIVersions;
@property (strong, nonatomic) MFCallback authFailureCallback;


@end

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
NSString* const MFCONF_API_VERSION      = @"default_api_version";
NSString* const MFCONF_API_VERSIONS     = @"default_api_versions";
NSString* const MFCONF_AUTHFAIL_CB      = @"auth_failure_callback";
NSString* const MFCONF_SSL              = @"prefer_ssl";



//------------------------------------------------------------------------------
- (id)init {
    NSParameterAssert(NO);
    return nil;
}

//------------------------------------------------------------------------------
- (id)initWithConfig:(NSDictionary*)config sdk:(MediaFireSDK *)sdk{
    
    if (config == nil) {
        erm(nullField:@"master config");
        return nil;
    }
    self = [super init];
    if ( self == nil ) {
        return nil;
    }
    
    _opLock = [[NSLock alloc] init];
    
    if (config[MFCONF_APPID] == nil) {
        erm(nullField:@"application identification");
        return nil;
    }
    
    _sdk = sdk;
    _appId = config[MFCONF_APPID];
    _apiKey = config[MFCONF_APIKEY];

    if (config[MFCONF_API_VERSIONS] != nil && [config[MFCONF_API_VERSIONS] isKindOfClass:[NSDictionary class]]) {
        _defaultAPIVersions = config[MFCONF_API_VERSIONS];
    }
    
    if (config[MFCONF_API_VERSION] != nil && [config[MFCONF_API_VERSION] isKindOfClass:[NSString class]]) {
        _defaultAPIVersion = config[MFCONF_API_VERSION];
    } else {
        _defaultAPIVersion = @"1.0";
    }
    
    if (config[MFCONF_CREDS_DELEGATE] != nil) {
        self.CredentialsDelegate = config[MFCONF_CREDS_DELEGATE];
    }
    else{
        self.CredentialsDelegate = [[MFCredentials alloc] init];
    }

    if (config[MFCONF_SRM_DELEGATE] != nil) {
        self.SerialRequestDelegateClass = config[MFCONF_SRM_DELEGATE];
    }

    if (config[MFCONF_PRM_DELEGATE] != nil) {
        self.ParallelRequestDelegateClass = config[MFCONF_PRM_DELEGATE];
    }

    if (config[MFCONF_NETIND_DELEGATE] != nil) {
        self.NetworkIndicatorDelegate = config[MFCONF_NETIND_DELEGATE];
    }
    
    if (config[MFCONF_MAXTOKEN] != nil) {
        NSUInteger max = [config[MFCONF_MAXTOKEN] unsignedIntegerValue];
        if (max > 0) {
            _maxTokens = max;
        }
    } else {
        _maxTokens = 10;
    }

    if (config[MFCONF_MINTOKEN] != nil) {
        NSUInteger min = [config[MFCONF_MINTOKEN] unsignedIntegerValue];
        if ((min < _maxTokens) && (min > 0)) {
            _minTokens = min;
        }
    } else {
        _minTokens = 3;
    }
    
    if (config[MFCONF_HTTPCLIENT] != nil) {
        _defaultHttpClientObj = [NSURLSession sessionWithConfiguration:config[MFCONF_HTTPCLIENT]];
    }
    
    if (config[MFCONF_AUTHFAIL_CB] != nil) {
        _authFailureCallback = config[MFCONF_AUTHFAIL_CB];
    }
    
    _preferSSL = (config[MFCONF_SSL] != nil);
    
    return self;
    
}

- (MediaFireSDK *)sdk{
    return _sdk;
}

//------------------------------------------------------------------------------
+ (instancetype)createWithConfig:(NSDictionary*)config sdk:(MediaFireSDK *)sdk{
    MFConfig *instance = [[MFConfig alloc] initWithConfig:config sdk:sdk];
    return instance;
}

//------------------------------------------------------------------------------
- (void)destroy {
    [self unregisterAllHTTPClients];
}

//------------------------------------------------------------------------------
- (Class)serialRequestDelegate {
    return [self SerialRequestDelegateClass];
}

//------------------------------------------------------------------------------
- (Class)parallelRequestDelegate {
    return [self ParallelRequestDelegateClass];
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
- (id)httpClientById:(NSString*)clientId {
    id client = nil;
    [self.opLock lock];
    client = self.httpClients[clientId];
    [self.opLock unlock];
    return client;
}

//------------------------------------------------------------------------------
- (NSString*)defaultAPIVersionForModule:(NSString*)className {
    // sanity check
    if (!className.length) {
        return [self defaultAPIVersion];
    }
    if ((self.defaultAPIVersions == nil) || (self.defaultAPIVersions.count == 0)) {
        return [self defaultAPIVersion];
    }
    id version = self.defaultAPIVersions[className];
    // client may not have configured this module with a default version.
    if ((version != nil) && ([version isKindOfClass:[NSString class]]) && ([(NSString*)version length])) {
        return version;
    }
    
    return [self defaultAPIVersion];
}

//------------------------------------------------------------------------------
- (void)showNetworkIndicator {
    if (self.NetworkIndicatorDelegate) {
        [self.NetworkIndicatorDelegate showNetworkIndicator];
    }
}

//------------------------------------------------------------------------------
- (void)hideNetworkIndicator {
    if (self.NetworkIndicatorDelegate) {
        [self.NetworkIndicatorDelegate hideNetworkIndicator];
    }
}

//------------------------------------------------------------------------------
- (NSURLSession*)defaultHttpClient {
    if (self.defaultHttpClientObj != nil) {
        return self.defaultHttpClientObj;
    } else {
        return [NSURLSession sharedSession];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-parameter"
//------------------------------------------------------------------------------
- (MFCallback)authenticationFailureCallback {
    if (!self.authFailureCallback) {
        return ^(NSDictionary* response) {
            mflog(@"Authentication Failure");
            return;
        };
    }
    return self.authFailureCallback;
}
#pragma clang diagnostic pop
@end
