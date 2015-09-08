//
//  BillingAPI.h
//  MediaFireSDK
//
//  Created by Mike Jablonski on 7/7/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPI.h"

@interface MFBillingAPI : MFAPI

/**
 @brief Returns an MFSoftwareAPI object initialized with a given API version
 number.
 
 @param version The version of the MediaFire API that the instance will default
 to.
 */
- (id)initWithVersion:(NSString*)version;

/**
 @brief Purchases a plan for the current user.
 
 @param parameters Dictionary with API parameter options.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)purchasePlan:(NSDictionary*)parameters withCallbacks:(NSDictionary*)callbacks;

/**
 @brief Purchases a plan for the current user.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for
 list of valid parameters.
 
 @param parameters Dictionary with API parameter options.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)purchasePlan:(NSDictionary*)options query:(NSDictionary*)parameters withCallbacks:(NSDictionary*)callbacks;

@end
