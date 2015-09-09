//
//  MFNotificationAPI.m
//  AppCore
//
//  Created by Daniel Dean on 2/28/15.
//  Copyright (c) 2015 MediaFire. All rights reserved.
//

#import "MFNotificationAPI.h"
#import "NSDictionary+MapObject.h"
#import "MFConfig.h"
#import "MFHTTPOptions.h"

@implementation MFNotificationAPI

//------------------------------------------------------------------------------
- (id)init {
    self = [self initWithVersion:[MFConfig defaultAPIVersionForModule:@"MFNotificationAPI"]];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (id)initWithVersion:(NSString*)version {
    self = [super initWithPath:@"notifications" version:version];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (void)peekCache:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self peekCache:@{} query:parameters callbacks:callbacks];
}

- (void)peekCache:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[options merge:@{HURL: @"peek_cache.php"}] query:parameters callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getCache:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getCache:@{} query:parameters callbacks:callbacks];
    
}

- (void)getCache:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[options merge:@{HURL: @"get_cache.php"}] query:parameters callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)sendMessage:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self sendMessage:@{} query:parameters callbacks:callbacks];
    
}

- (void)sendMessage:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[options merge:@{HURL: @"send_message.php"}] query:parameters callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)sendNotification:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self sendNotification:@{} query:parameters callbacks:callbacks];
    
}

- (void)sendNotification:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[options merge:@{HURL: @"send_notification.php"}] query:parameters callbacks:callbacks];
}

@end
