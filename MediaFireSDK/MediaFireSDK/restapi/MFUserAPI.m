//
//  MFUserAPI.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 2/25/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFUserAPI.h"
#import "MFConfig.h"
#import "NSDictionary+MapObject.h"
#import "MFHTTPOptions.h"

@implementation MFUserAPI

//------------------------------------------------------------------------------
- (id)init {
    self = [self initWithVersion:[MFConfig defaultAPIVersionForModule:@"MFUserAPI"]];
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
- (void)acceptTOS:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self acceptTOS:@{} query:parameters callbacks:callbacks];
}

- (void)acceptTOS:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self acceptTOSConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)fetchTOS:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self fetchTOS:@{} query:parameters callbacks:callbacks];
}

- (void)fetchTOS:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self fetchTOSConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getAvatar:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getAvatar:@{} query:parameters callbacks:callbacks];
}

- (void)getAvatar:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getAvatarConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getInfo:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getInfo:@{} query:parameters callbacks:callbacks];
}

- (void)getInfo:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getInfoConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getLimits:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getLimits:@{} query:parameters callbacks:callbacks];
}

- (void)getLimits:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getLimitsConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getLoginToken:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getLoginToken:@{} query:parameters callbacks:callbacks];
}

- (void)getLoginToken:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getLoginTokenConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getSessionToken:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getSessionToken:@{} query:parameters callbacks:callbacks];

}

- (void)getSessionToken:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getSessionTokenConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getSettings:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getSettings:@{} query:parameters callbacks:callbacks];
}

- (void)getSettings:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getSettingsConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)linkFacebook:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self linkFacebook:@{} query:parameters callbacks:callbacks];
}

- (void)linkFacebook:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self linkFacebookConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)linkTwitter:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self linkTwitter:@{} query:parameters callbacks:callbacks];
}

- (void)linkTwitter:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self linkTwitterConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)registerUser:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self registerUser:@{} query:parameters callbacks:callbacks];
}

- (void)registerUser:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self registerUserConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)setAvatar:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self setAvatar:@{} query:parameters callbacks:callbacks];
}

- (void)setAvatar:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self setAvatarConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)setSettings:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self setSettings:@{} query:parameters callbacks:callbacks];
}

- (void)setSettings:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self setSettingsConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)unlinkFacebook:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self unlinkFacebook:@{} query:parameters callbacks:callbacks];
}

- (void)unlinkFacebook:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self unlinkFacebookConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)unlinkTwitter:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self unlinkTwitter:@{} query:parameters callbacks:callbacks];
}

- (void)unlinkTwitter:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self unlinkTwitterConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)update:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self update:@{} query:parameters callbacks:callbacks];
}

- (void)update:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self updateConf:options query:parameters] callbacks:callbacks];
}


//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)acceptTOSConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"accept_tos.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)fetchTOSConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"fetch_tos.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getAvatarConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"get_avatar.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getInfoConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"get_info.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getLimitsConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"get_limits.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getLoginTokenConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL :@"get_login_token.php",
                                                          HMETHOD : @"POST",
                                                          HSECURE : @"true",
                                                          HTOKEN : HTKT_NONE}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getSessionTokenConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"get_session_token.php",
                                                          HMETHOD : @"POST",
                                                          HSECURE : @"true",
                                                          HTOKEN : HTKT_NONE}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getSettingsConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"get_settings.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)linkFacebookConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"link_facebook.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)linkTwitterConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"link_twitter.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)registerUserConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"register.php",
                                                          HMETHOD : @"POST",
                                                          HSECURE : @"true",
                                                          HTOKEN : HTKT_NONE}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)setAvatarConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"set_avatar.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)setSettingsConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"set_settings.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)unlinkFacebookConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"unlink_facebook.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)unlinkTwitterConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"unlink_twitter.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)updateConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"update.php"}]
                                   query:parameters];
}


@end
