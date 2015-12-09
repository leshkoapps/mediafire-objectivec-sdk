//
//  MFActionTokenAPI.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/14/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFActionTokenAPI.h"
#import "MFAPIURLRequestConfig.h"
#import "MFConfig.h"
#import "MFSerialRequestManagerDelegate.h"
#import "NSDictionary+MapObject.h"
#import "MFHTTPOptions.h"

@implementation MFActionTokenAPI

//------------------------------------------------------------------------------
- (id)init {
    self = [self initWithVersion:[MFConfig defaultAPIVersionForModule:@"MFActionTokenAPI"]];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (id)initWithVersion:(NSString*)version {
    self = [super initWithPath:@"user" version:version];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (void)getActionToken:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getActionToken:@{} query:parameters callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getActionToken:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary *)callbacks {
    // put all action requests of this type on hold until we get a new token.
    MFAPIURLRequestConfig* config = [self getActionTokenConf:options query:parameters];
    [[MFConfig serialRequestDelegate] createRequest:config callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getActionTokenConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"get_action_token.php",
                                                          HMETHOD: @"POST",
                                                          HSECURE: @"true"}]
                                   query:parameters];
}

@end
