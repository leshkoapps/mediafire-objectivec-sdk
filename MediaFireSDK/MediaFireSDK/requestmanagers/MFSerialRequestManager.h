//
//  MFSerialRequestManager.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/31/13.
//  Copyright (c) 2013 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFSerialRequestManagerDelegate.h"
@class MFSessionAPI;
@class MFAPIURLRequestConfig;

/**
 * The SRM maintains a cache of 1 or more session tokens for use by
 * the system. Login/logout is initiated through the SRM, directly.
 * MFAPI calls use the SRM to augment calls with session token and
 * signature parameters. When a token is released for use in other calls, it is
 * updated according to version 2 session token requirements. If the API call
 * fails (or its response does not indicate new_key=yes), a releaseWithNoUpdate
 * method unlocks the token for further use without updating it. Tokens should
 * be abandoned if the API call returns an error indicating that the token has
 * expired or our updates are no longer in synch with the server's.
 */
@interface MFSerialRequestManager : NSObject <MFSerialRequestManagerDelegate>
@property(strong,nonatomic) MFSessionAPI* sessionAPI;

/**
 * Terminate current session.
 *
 * Terminates session, clearing session tokens, and attempts to abort any active
 * network connections.
 *
 * Actively executing API calls may complete successfully or terminate with an
 * error; an error category of ERRCAT_NET may simply refer to the interruption
 * of the connection caused by endSession. API call requests waiting for an
 * available session token will receive an error with code ERRCODE_SESSION_CLOSED.
 */
+ (void)endSession;
+ (BOOL)hasSession;
+ (void)login:(NSDictionary *)credentials callbacks:(NSDictionary *)callbacks;

+ (void)releaseToken:(NSString*)token forResponse:(NSDictionary*) response;

// Session Token API

- (void)addRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)callbacks; 

+ (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary *)callbacks;
+ (void)abandonToken:(NSString*)token;

@end
