//
//  MFAPIBase.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/13/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MFAPIURLRequestConfig;
@class MFRequestManager;

@interface MFAPIBase : NSObject

@property(strong,nonatomic) NSString* method;
@property(strong,nonatomic) NSString* httpClientId;
@property(strong,nonatomic) NSDictionary* headers;

- (id)initWithPath:(NSString*)path version:(NSString*)version requestManager:(MFRequestManager *)requestManager;

- (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)cb;

- (NSString*)formatLocation:(NSString*)url;

- (NSString*)path;
- (NSString*)version;
- (MFRequestManager *)requestManager;

- (void)setOverrides:(MFAPIURLRequestConfig*)config;

@end
