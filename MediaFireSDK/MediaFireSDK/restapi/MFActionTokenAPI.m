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
#import "MFRequestManager.h"


@interface MFActionTokenAPI()

@end


@implementation MFActionTokenAPI

- (instancetype)init{
    NSParameterAssert(NO);
    return nil;
}

//------------------------------------------------------------------------------
- (id)initWithRequestManager:(MFRequestManager *)requestManager {
    self = [self initWithVersion:[requestManager.globalConfig defaultAPIVersionForModule:@"MFActionTokenAPI"] requestManager:requestManager];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (id)initWithVersion:(NSString*)version requestManager:(MFRequestManager *)requestManager{
    self = [super initWithPath:@"user" version:version requestManager:requestManager];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (void)getActionToken:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getActionToken:@{} query:parameters callbacks:callbacks];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-parameter"
//------------------------------------------------------------------------------
- (void)getActionToken:(NSDictionary*)options query:(NSDictionary *)parameters callbacks:(NSDictionary *)callbacks {
    // put all action requests of this type on hold until we get a new token.
    MFAPIURLRequestConfig* config = [[MFAPIURLRequestConfig alloc] initWithOptions:options query:parameters config:self.requestManager.globalConfig];
    config.location = [self formatLocation:@"get_action_token.php"];
    config.method = @"POST";
    config.secure = true;
    config.queryDict = parameters;
    [self setOverrides:config];
    [self.requestManager.serialRequestDelegate createRequest:config callbacks:callbacks];
}
#pragma clang diagnostic pop

@end
