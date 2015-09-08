//
//  MFNotificationAPI.h
//  AppCore
//
//  Created by Daniel Dean on 2/28/15.
//  Copyright (c) 2015 MediaFire. All rights reserved.
//

#import "MFAPI.h"

/**
 @brief The interface for conducting notification operations.
 */
@interface MFNotificationAPI : MFAPI

/**
 @brief Returns an MFNotificationAPI object initialized with a given API version number.
 
 @param version The version of the MediaFire API that the instance will default to.
 */
- (id)initWithVersion:(NSString*)version;

/**
 @brief Gets the current number of pending messages for the current user.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.3/notifications.php#peek_cache)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)peekCache:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets the current number of pending messages for the current user.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.3/notifications.php#peek_cache)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)peekCache:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets and clears a specified number of the most recent cache-only notifications for the current user.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.3/notifications.php#get_cache)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getCache:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets and clears a specified number of the most recent cache-only notifications for the current user.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.3/notifications.php#get_cache)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getCache:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Sends a message to another MediaFire user.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.3/notifications.php#send_message)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)sendMessage:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Sends a message to another MediaFire user.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.3/notifications.php#send_message)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)sendMessage:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Sends a message to a non-MediaFire user.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/notifications.php#send_notification)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)sendNotification:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Sends a message to a non-MediaFire user.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/notifications.php#send_notification)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)sendNotification:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


@end
