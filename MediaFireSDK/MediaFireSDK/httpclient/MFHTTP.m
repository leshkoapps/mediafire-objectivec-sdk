//
//  MFHTTP.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 11/1/13.
//  Copyright (c) 2013 MediaFire. All rights reserved.
//

#import "MFHTTP.h"
#import "NSDictionary+MapObject.h"
#import "MFErrorMessage.h"
#import "MFErrorLog.h"
#import "MFURLRequestConfig.h"
#import "MFConfig.h"
#import "MFHTTPClientDelegate.h"
#import "MFConfig.h"

@interface MFHTTP(){
    MFConfig *_globalConfig;
}

@end



@implementation MFHTTP

//------------------------------------------------------------------------------
- (id)init {
    NSParameterAssert(NO);
    return nil;
}

- (instancetype)initWithConfig:(MFConfig *)config{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    _globalConfig = config;
    return self;
}

- (MFConfig *)globalConfig{
    return _globalConfig;
}

//------------------------------------------------------------------------------
- (NSURLSessionTask *)execute:(MFURLRequestConfig*)config {
    if ([config.method isEqualToString:@"POST"]) {
#if defined(DEBUG)
        mflog(@"POST %@\n%@",[config.url absoluteString], config.query);
#else
        mflog(@"POST %@",[config.url absoluteString]);
#endif
        // construct the request
        if ((config.body != nil) || [config.localPathForUpload absoluteString].length) {
            // upload a file from it's path on disk.
            config.url = [self addParams:config.query toUrl:config.url];
            return [self uploadRequest:config];
        } else {
            // Normal text POST.
            config.body = [NSData dataWithBytes:[config.query cStringUsingEncoding:NSUTF8StringEncoding] length:[config.query length]];
            return [self standardRequest:config];
        }
    } else {
        config.url = [self addParams:config.query toUrl:config.url];
        mflog(@"GET %@",[config.url absoluteString]);
        if ([config.localPathForDownload absoluteString].length) {
            return [self downloadRequest:config];
        } else {
            return [self standardRequest:config];
        }
    }
    return nil;
}

//------------------------------------------------------------------------------
- (NSMutableURLRequest*)createRequestFromConfig:(MFURLRequestConfig*)config {
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:config.url];
    [request setHTTPMethod:config.method];
    for (NSString* headerName in config.headers) {
        [request setValue:config.headers[headerName] forHTTPHeaderField:headerName];
    }
    return request;
}

//------------------------------------------------------------------------------
- (NSURLSessionTask *)attemptRequestThruCustomClient:(MFURLRequestConfig*)config {
    if (config.httpClientId.length) {
        id client = [self.globalConfig httpClientById:config.httpClientId];
        if ([client conformsToProtocol:@protocol(MFHTTPClientDelegate)]) {
            return [client addRequest:config];
        }
    }
    return nil;
}

//------------------------------------------------------------------------------
- (NSURLSessionTask *)downloadRequest:(MFURLRequestConfig*)config {
    NSURLSessionTask *customTask = [self attemptRequestThruCustomClient:config];
    if (customTask!=nil) {
        return customTask;
    }
    
    NSURL* localUrl = config.localPathForDownload;
    NSURLRequest* request = [self createRequestFromConfig:config];
    
    __weak typeof (self) weakSelf = self;
    NSURLSessionTask *task = [[self.globalConfig defaultHttpClient] downloadTaskWithRequest:request completionHandler:^(NSURL* location, NSURLResponse* response, NSError* error) {
        [weakSelf.globalConfig hideNetworkIndicator];

        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        // Some NSURLSession error
        if (error != nil) {
            erm(badHTTP:httpResponse.statusCode message:@"Unable to download file.");
            config.httpFail(nil, httpResponse.statusCode, nil);
            return;
        }
        // Likely an incorrect url
        if (httpResponse.statusCode != 200) {
            erm(badHTTP:httpResponse.statusCode message:@"Unable to find file.");
            config.httpFail(nil, httpResponse.statusCode, nil);
            return;
        }
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *errorCopy;
        if (![fileManager copyItemAtURL:location toURL:localUrl error:&errorCopy]) {
            config.httpFail(nil, ERRCODE_FILECOPY, nil);
        }
        
        if (httpResponse.statusCode == 200) {
            config.httpSuccess(@{@"filename" : localUrl.path}, 200, nil);
        } else {
            erm(badHTTP:httpResponse.statusCode message:@"Unknown error.");
            config.httpFail(nil, httpResponse.statusCode, nil);
        }
    }];
    [self.globalConfig showNetworkIndicator];
    [task resume];
    return task;
}

//------------------------------------------------------------------------------
- (NSURLSessionTask *)standardRequest:(MFURLRequestConfig*)config {
    NSURLSessionTask *customTask = [self attemptRequestThruCustomClient:config];
    if (customTask!=nil) {
        return customTask;
    }
    NSMutableURLRequest* request = [self createRequestFromConfig:config];
    if ([config.method isEqualToString:@"POST"]) {
        [request setHTTPBody:config.body];
    }
    NSURLSessionTask *task = [[self.globalConfig defaultHttpClient] dataTaskWithRequest:request completionHandler:[self getCompletionHandlerFor:config]];
    [self.globalConfig showNetworkIndicator];
    [task resume];
    return task;
}

//------------------------------------------------------------------------------
- (HTTPCompletionHandler)getCompletionHandlerFor:(MFURLRequestConfig*)config {
    __weak typeof (self) weakSelf = self;
    return ^(NSData* data, NSURLResponse* response, NSError* error) {
        [weakSelf.globalConfig hideNetworkIndicator];
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSString* responseText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if (error != nil) {
            config.httpFail(nil, httpResponse.statusCode, nil);
            return;
        }
        
        if (httpResponse.statusCode != 200) {
            config.httpFail(responseText, httpResponse.statusCode, nil);
        } else {
            if ((responseText == nil) && (data.length > 0)) {
                config.httpSuccess(nil, 200, @{@"blob" : data});
                return;
            }
            config.httpSuccess(responseText, 200, nil);
        }
        
    };
}

//------------------------------------------------------------------------------
- (NSURLSessionTask *)uploadRequest:(MFURLRequestConfig*)config {
    NSURLSessionTask *customTask = [self attemptRequestThruCustomClient:config];
    if (customTask!=nil) {
        return customTask;
    }
    NSURLRequest* request = [self createRequestFromConfig:config];
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (config.localPathForUpload != nil && ([fileManager fileExistsAtPath:config.localPathForUpload.path])) {
        NSURLSessionTask *task = [[self.globalConfig defaultHttpClient] uploadTaskWithRequest:request fromFile:config.localPathForUpload completionHandler: [self getCompletionHandlerFor:config]];
        [self.globalConfig showNetworkIndicator];
        [task resume];
        return task;
    }
    mflog(@"No file found for upload.");
    if (config.body != nil) {
        NSURLSessionTask *task = [[self.globalConfig defaultHttpClient] uploadTaskWithRequest:request fromData:config.body completionHandler: [self getCompletionHandlerFor:config]];
        [self.globalConfig showNetworkIndicator];
        [task resume];
        return task;
    }
    mflog(@"No data found for upload.");
    config.httpFail(nil, 0, nil);
    return nil;
}

//------------------------------------------------------------------------------
- (NSURL*)addParams:(NSString*)query toUrl:(NSURL*)url {
    if (!query.length) {
        return url;
    }
    
    NSString* stringUrl = [url absoluteString];
    
    NSString* joiner = @"&";
    if ([stringUrl rangeOfString:@"?"].location == NSNotFound) {
        joiner = @"?";
    }
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",stringUrl,joiner,query]];
}

@end
