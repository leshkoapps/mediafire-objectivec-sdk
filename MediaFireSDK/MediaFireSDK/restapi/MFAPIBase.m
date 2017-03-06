//
//  MFAPIBase.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/13/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPIBase.h"
#import "MFAPIURLRequestConfig.h"
#import "MFHTTPOptions.h"
#import "MFErrorMessage.h"
#import "NSDictionary+Callbacks.h"
#import "MFRequestHandler.h"
#import "MFConfig.h"
#import "MFRequestManager.h"



static NSString* const DEFAULT_METHOD = @"POST";

@interface MFAPIBase()

@property(strong,nonatomic) NSString* path;
@property(strong,nonatomic) NSString* version;
@property(strong,nonatomic) MFRequestManager* requestManager;

@end

@implementation MFAPIBase

- (instancetype)init{
    NSParameterAssert(NO);
    return nil;
}

//------------------------------------------------------------------------------

- (id)initWithPath:(NSString*)path version:(NSString*)version requestManager:(MFRequestManager *)requestManager{
    self = [super init];
    if (self) {
        _path = [NSString stringWithFormat:@"/api/%@/%@/",version,path];
        _version = version;
        _requestManager = requestManager;
    }
    return self;
}

- (MFRequestManager *)requestManager{
    return _requestManager;
}

//------------------------------------------------------------------------------
- (NSString*)formatLocation:(NSString*)url {
    return [NSString stringWithFormat:@"%@%@",self.path,url];
}

//------------------------------------------------------------------------------
- (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)cb {
    if (cb == nil) {
        erm(NullCallback);
        return;
    }
    
    if (config == nil) {
        cb.onerror(erm(nullField:@"config"));
        return;
    }
    
    config.location = [self formatLocation:config.location];
    
    config.url = [config generateURL];
    
    [self setOverrides:config];
    
    [self.requestManager.requestHandler createRequest:config callbacks:cb];
}

//------------------------------------------------------------------------------
- (void)setOverrides:(MFAPIURLRequestConfig*)config {
    if (self.method.length) {
        config.method = self.method;
    }
    
    if (self.httpClientId.length) {
        config.httpClientId = self.httpClientId;
    }
    
}

@end
