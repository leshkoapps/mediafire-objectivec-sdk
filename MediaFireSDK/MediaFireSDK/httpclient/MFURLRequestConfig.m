//
//  MFURLRequestConfig.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 6/3/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFURLRequestConfig.h"
#import "MFConfig.h"

@interface MFURLRequestConfig(){
    MFConfig *_config;
}

@end



@implementation MFURLRequestConfig

//------------------------------------------------------------------------------
- (id)init {
    NSParameterAssert(NO);
    return nil;
}

- (instancetype)initWithConfig:(MFConfig *)config{
    self = [super init];
    if (self ) {
        _url = nil;
        _method = nil;
        _secure = false;
        _headers = nil;
        _query = nil;
        _body = nil;
        _localPathForUpload = nil;
        _localPathForDownload = nil;
        _desc = nil;
        _httpClientId = nil;
        _httpSuccess = nil;
        _httpFail = nil;
        _httpProgress = nil;
        _httpReference = nil;
        _config = config;
    }
    return self;
}

- (MFConfig *)globalConfig{
    return _config;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-parameter"

//------------------------------------------------------------------------------
- (OperationBlock)httpSuccess {
    if (_httpSuccess == nil) {
        _httpSuccess = ^(id response, NSInteger status, NSDictionary* downloaded) {
        };
    }
    return _httpSuccess;
}

//------------------------------------------------------------------------------
- (OperationBlock)httpFail {
    if (_httpFail == nil) {
        _httpFail = ^(id response, NSInteger status, NSDictionary* downloaded) {
        };
    }
    return _httpFail;
}

//------------------------------------------------------------------------------
- (ProgressBlock)httpProgress {
    if (_httpProgress == nil) {
        _httpProgress = ^(double progress) {
        };
    }
    return _httpProgress;
}

//------------------------------------------------------------------------------
- (ReferenceCallback)httpReference {
    if (_httpReference == nil) {
        _httpReference = ^(NSURLSessionTask* connection) {
        };
    }
    return _httpReference;
}
#pragma clang diagnostic pop


@end
