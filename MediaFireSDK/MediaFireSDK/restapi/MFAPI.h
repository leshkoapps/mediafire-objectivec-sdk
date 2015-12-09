//
//  MFAPI.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 2/20/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MFAPIURLRequestConfig;

@interface MFAPI : NSObject

@property(nonatomic, strong) NSString* method;
@property(nonatomic, strong) NSString* httpClientId;
@property(nonatomic, strong) NSDictionary* headers;
@property(nonatomic, strong, readonly) NSString* path;
@property(nonatomic, strong, readonly) NSString* version;

- (id)initWithPath:(NSString*)path version:(NSString*)version;

/*
 @brief Passes the request config on to a request handler where it will be used
 to create a URL request and executed.
 
 @param config A request config object that will be used to create a URL 
 request.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)cb;

/*
 @brief Applies the correct folder prefixes for the url request, based on the 
 the current path and version values.
 
 @param url The url to be formatted.
 */
- (NSString*)formatLocation:(NSString*)url;

/*
 @brief Enforces that certain properties in the request match those of this 
 instance, if the properties on this instance are not nil.  The properties that
 are enforced are HTTP method (POST/GET) and HTTP client ID.  The changes are 
 applied directly to the given request config object.
 
 @param config The request config object to be subject to enforcement.
 */
- (void)setOverrides:(MFAPIURLRequestConfig*)config;

/*
 @brief Returns A request config initialized using the given dictionaries.
 
 @param options A dictionary containing options for the http client.
 
 @param params A dictionary containing the url/post parameters fort he request.
 */
- (MFAPIURLRequestConfig*)createConfigWithOptions:(NSDictionary*)options query:(NSDictionary*)params;

@end
