//
//  MFAPI.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 2/20/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPI.h"
#import "MFRequestManager.h"
#import "NSDictionary+Callbacks.h"
#import "MFErrorLog.h"
#import "MFErrorMessage.h"
#import "NSString+StringURL.h"
#import "MFHTTPOptions.h"
#import "MFAPIURLRequestConfig.h"
#import "MFRequestHandler.h"

static NSString* const DEFAULT_METHOD = @"POST";

@interface MFAPI()

@property(nonatomic, strong, readwrite) NSString* path;
@property(nonatomic, strong, readwrite) NSString* version;

@end

@implementation MFAPI

//------------------------------------------------------------------------------
- (id)initWithPath:(NSString*)path version:(NSString*)version {
    self = [super init];
    if (self) {
        _path = [NSString stringWithFormat:@"/api/%@/%@/",version,path];
        _version = version;
    }
    return self;
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
    
    [MFRequestManager createRequest:config callbacks:cb];
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

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)createConfigWithOptions:(NSDictionary*)options query:(NSDictionary*)params {
    MFAPIURLRequestConfig* config = [[MFAPIURLRequestConfig alloc] initWithOptions:options query:params];
    if (config == nil) {
        return nil;
    }
    config.location = [self formatLocation:options[HURL]];
    
    [self setOverrides:config];
    
    return config;
    
}


@end
