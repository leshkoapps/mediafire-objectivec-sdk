//
//  MediaFireSDK.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 4/15/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFSessionAPI.h"
#import "MFActionTokenAPI.h"
#import "MFContactAPI.h"
#import "MFDeviceAPI.h"
#import "MFFileAPI.h"
#import "MFFolderAPI.h"
#import "MFSystemAPI.h"
#import "MFUploadAPI.h"
#import "MFUploadTransaction.h"
#import "MFUserAPI.h"
#import "MFMediaAPI.h"

@interface MediaFireSDK : NSObject

+ (bool)createWithConfig:(NSDictionary*)config;

+ (instancetype)getInstance;

- (void)startSession:(NSString*)email withPassword:(NSString*)password andCallbacks:(NSDictionary*)callbacks;
+ (void)startSession:(NSString*)email withPassword:(NSString*)password andCallbacks:(NSDictionary*)callbacks;

- (void)startSessionWithCallbacks:(NSDictionary*)callbacks;
+ (void)startSessionWithCallbacks:(NSDictionary*)callbacks;

- (void)startFacebookSession:(NSString*)authToken withCallbacks:(NSDictionary*)callbacks;
+ (void)startFacebookSession:(NSString*)authToken withCallbacks:(NSDictionary*)callbacks;

- (void)endSession;
+ (void)endSession;

+ (BOOL)hasSession;

- (void)destroy;
+ (void)destroy;

- (MFSessionAPI*)SessionAPI;
+ (MFSessionAPI*)SessionAPI;

- (MFActionTokenAPI*)ActionTokenAPI;
+ (MFActionTokenAPI*)ActionTokenAPI;

- (MFContactAPI*)ContactAPI;
+ (MFContactAPI*)ContactAPI;

- (MFDeviceAPI*)DeviceAPI;
+ (MFDeviceAPI*)DeviceAPI;

- (MFFileAPI*)FileAPI;
+ (MFFileAPI*)FileAPI;

- (MFFolderAPI*)FolderAPI;
+ (MFFolderAPI*)FolderAPI;

- (MFSystemAPI*)SystemAPI;
+ (MFSystemAPI*)SystemAPI;

- (MFUploadAPI*)UploadAPI;
+ (MFUploadAPI*)UploadAPI;

- (MFUserAPI*)UserAPI;
+ (MFUserAPI*)UserAPI;

- (MFMediaAPI*)MediaAPI;
+ (MFMediaAPI*)MediaAPI;


@end
