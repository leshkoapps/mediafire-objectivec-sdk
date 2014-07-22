//
//  MFRequestManager.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 2/19/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MFAPIURLRequestConfig;
@class MFActionTokenAPI;
@class MFSessionAPI;

@interface MFRequestManager : NSObject

+ (MFRequestManager*)instance;

+ (void)createRequest:(MFAPIURLRequestConfig*)options callbacks:(NSDictionary*)cb;

+ (void)startSession:(NSString*)email withPassword:(NSString*)password andCallbacks:(NSDictionary*)callbacks;
+ (void)startSessionWithCallbacks:(NSDictionary*)callbacks;
+ (void)startFacebookSession:(NSString*)authToken withCallbacks:(NSDictionary*)callbacks;
+ (void)endSession;
+ (BOOL)hasSession;
+ (void)destroy;

+ (void)setSessionTokenAPI:(MFSessionAPI*)sessionAPI;
+ (void)setActionTokenAPI:(MFActionTokenAPI*)actionAPI forType:(NSString*)type;

@end