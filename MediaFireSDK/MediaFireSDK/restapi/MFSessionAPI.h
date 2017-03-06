//
//  MFSessionAPI.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/10/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPIBase.h"

/**
 @brief The interface for requesting session tokens.
 */
@interface MFSessionAPI : MFAPIBase

- (id)initWithRequestManager:(MFRequestManager *)requestManager;
- (id)initWithVersion:(NSString*)version requestManager:(MFRequestManager *)requestManager;


/**
 @brief Requests an action token.
 
 @param credentials Dictionary with a credentials set.  See MFCredentials.h for details.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getSessionToken:(NSDictionary*)credentials callbacks:(NSDictionary*)callbacks;

/**
 @brief Requests an action token.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param credentials Dictionary with a credentials set.  See MFCredentials.h for details.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getSessionToken:(NSDictionary*)options query:(NSDictionary*)credentials callbacks:(NSDictionary*)callbacks;

@end
