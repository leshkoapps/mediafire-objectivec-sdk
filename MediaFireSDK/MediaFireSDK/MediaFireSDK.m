//
//  MediaFireSDK.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 4/15/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MediaFireSDK.h"
#import "MFConfig.h"
#import "MFRequestManager.h"
#import "MFSerialRequestManager.h"
#import "MFParallelRequestManager.h"
#import "MFCredentials.h"
#import "NSDictionary+MapObject.h"
#import "MFConfig.h"
#import "MFRequestHandler.h"
#import "MFHTTP.h"

@interface MediaFireSDK(){
    NSDictionary *_configDict;
}

@property(strong,nonatomic,getter=SessionAPI)MFSessionAPI*  session;
@property(strong,nonatomic,getter=ActionTokenAPI)MFActionTokenAPI*  token;
@property(strong,nonatomic,getter=ContactAPI)MFContactAPI*  contact;
@property(strong,nonatomic,getter=DeviceAPI)MFDeviceAPI*    device;
@property(strong,nonatomic,getter=FileAPI)MFFileAPI*        file;
@property(strong,nonatomic,getter=FolderAPI)MFFolderAPI*    folder;
@property(strong,nonatomic,getter=SystemAPI)MFSystemAPI*    system;
@property(strong,nonatomic,getter=UploadAPI)MFUploadAPI*    upload;
@property(strong,nonatomic,getter=UserAPI)MFUserAPI*        user;
@property(strong,nonatomic,getter=MediaAPI)MFMediaAPI*      media;
@property(strong,nonatomic,getter=RequestManager)MFRequestManager*      requestManager;
@property(strong,nonatomic,getter=Configuration)MFConfig*    globalConfig;

@end

@implementation MediaFireSDK

//------------------------------------------------------------------------------
- (instancetype)init{
    NSParameterAssert(NO);
    return nil;
}

//------------------------------------------------------------------------------
- (id) initWithConfig:(NSDictionary*)config {
    if (config == nil) {
        return nil;
    }
    self = [super init];
    if(self){
        _configDict = config;
    }
    return self;
}

//------------------------------------------------------------------------------
+ (instancetype)createWithConfig:(NSDictionary*)configDict {

    if (configDict == nil) {
        return nil;
    }

    MediaFireSDK *sdk = [[MediaFireSDK alloc] initWithConfig:configDict];
    
    NSMutableDictionary* defaults = [[NSMutableDictionary alloc] init];
    
    if (configDict[MFCONF_SRM_DELEGATE] == nil) {
        defaults[MFCONF_SRM_DELEGATE] = [MFSerialRequestManager class];
    }
    if (configDict[MFCONF_PRM_DELEGATE] == nil) {
        defaults[MFCONF_PRM_DELEGATE] = [MFParallelRequestManager class];
    }
    if (configDict[MFCONF_CREDS_DELEGATE] == nil) {
        defaults[MFCONF_CREDS_DELEGATE] = [[MFCredentials alloc] init];
    }
    configDict = [configDict merge:defaults];
    
    MFConfig *globalConfig = [MFConfig createWithConfig:configDict sdk:sdk];
    sdk.globalConfig = globalConfig;
    
    MFHTTP *http = [[MFHTTP alloc] initWithConfig:globalConfig];
    MFRequestHandler *requestHandler = [[MFRequestHandler alloc] initWithHTTP:http];
    MFRequestManager *requestManager = [[MFRequestManager alloc] initWithRequestHandler:requestHandler];
    sdk.requestManager = requestManager;
    
    [requestManager setSessionTokenAPI:sdk.SessionAPI];
    [requestManager setActionTokenAPI:sdk.ActionTokenAPI forType:@"image"];
    [requestManager setActionTokenAPI:sdk.ActionTokenAPI forType:@"upload"];
    
    return sdk;
}

//------------------------------------------------------------------------------
- (void)startSession:(NSString*)email withPassword:(NSString*)password andCallbacks:(NSDictionary*)callbacks {
    [self.requestManager startSession:email withPassword:password andCallbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)startSessionWithCallbacks:(NSDictionary*)callbacks {
    [self.requestManager startSessionWithCallbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)startFacebookSession:(NSString*)authToken withCallbacks:(NSDictionary*)callbacks {
    [self.requestManager startFacebookSession:authToken withCallbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)endSession {
    [self.requestManager endSession];
}

//------------------------------------------------------------------------------
- (BOOL)hasSession {
    return [self.requestManager hasSession];
}

//------------------------------------------------------------------------------
- (void)destroy {
    [self.requestManager destroy];
    [self.globalConfig destroy];
}

//------------------------------------------------------------------------------
- (MFSessionAPI*)SessionAPI {
    if (_session == nil) {
        _session = [[MFSessionAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _session;
}

//------------------------------------------------------------------------------
- (MFActionTokenAPI*)ActionTokenAPI {
    if (_token == nil) {
        _token = [[MFActionTokenAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _token;
}

//------------------------------------------------------------------------------
- (MFContactAPI*)ContactAPI {
    if (_contact == nil) {
        _contact = [[MFContactAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _contact;
}

//------------------------------------------------------------------------------
- (MFDeviceAPI*)DeviceAPI {
    if (_device == nil) {
        _device = [[MFDeviceAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _device;
}


//------------------------------------------------------------------------------
- (MFFileAPI*)FileAPI {
    if (_file == nil) {
        _file = [[MFFileAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _file;
}

//------------------------------------------------------------------------------
- (MFFolderAPI*)FolderAPI {
    if (_folder == nil) {
        _folder = [[MFFolderAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _folder;
}

//------------------------------------------------------------------------------
- (MFSystemAPI*)SystemAPI {
    if (_system == nil) {
        _system = [[MFSystemAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _system;
}

//------------------------------------------------------------------------------
- (MFUploadAPI*)UploadAPI {
    if (_upload == nil) {
        _upload= [[MFUploadAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _upload;
}

//------------------------------------------------------------------------------
- (MFUserAPI*)UserAPI {
    if (_user == nil) {
        _user = [[MFUserAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _user;
}

//------------------------------------------------------------------------------
- (MFMediaAPI*)MediaAPI {
    if (_media == nil) {
        _media = [[MFMediaAPI alloc] initWithRequestManager:self.requestManager];
    }
    return _media;
}

@end
