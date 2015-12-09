//
//  MFAPISessionManagerDelegate.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 11/13/15.
//  Copyright © 2015 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 @brief Defines the interface for MFAPI session management.
*/

@protocol MFAPISessionManagerDelegate <NSObject>
/*	
 @brief Begins a session with the MediaFire API using the given credentials.

 @param email The email address of the user account.

 @param password The password associated with the email address.

 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
*/
- (void)startSession:(NSString*)email withPassword:(NSString*)password andCallbacks:(NSDictionary*)callbacks;

/*
 @brief Begins a session with the MediaFire API using previously saved 
 credentials.

 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
*/
- (void)startSessionWithCallbacks:(NSDictionary*)callbacks;

/*
 @brief Begins a session with the MediaFire API using the given facebook token.

 @param authToken Token provided by Facebook for authentication.

 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
*/
- (void)startFacebookSession:(NSString*)authToken withCallbacks:(NSDictionary*)callbacks;

/*
 @brief Ends the current MediaFire API session.
*/
- (void)endSession;

/*
 @brief Returns true if the session manager delegate has an active session.
*/
- (BOOL)hasSession;
@end
