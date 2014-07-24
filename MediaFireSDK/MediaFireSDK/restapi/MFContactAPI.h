//
//  MFContactAPI.h
//  MediaFireSDK
//
//  Created by Mike Jablonski on 3/19/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPI.h"

@interface MFContactAPI : MFAPI

/**
 @brief Returns an MFContactAPI object initialized with a given API version number.
 
 @param version The version of the MediaFire API that the instance will default to.
 */
- (id)initWithVersion:(NSString*)version;

/**
 @brief Adds a new contact, updates an existing contact, or imports/syncs a 
 third-party contact to the current session user's contact list.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#add)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)add:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Adds a new contact, updates an existing contact, or imports/syncs a
 third-party contact to the current session user's contact list.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#add)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)add:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Delete a contact from the current session user's contact list.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#delete)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)delete:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Delete a contact from the current session user's contact list.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#delete)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)delete:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

@end
