//
//  MFContactAPI.h
//  MediaFireSDK
//
//  Created by Mike Jablonski on 3/19/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPI.h"

/**
 @brief The interface for conducting contact operations.
 */
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

/**
 @brief Fetches the contact list.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#fetch)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)fetch:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Fetches the contact list.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#fetch)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)fetch:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets the url of the current user's avatar.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#get_avatar)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getAvatar:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets the url of the current user's avatar.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#get_avatar)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getAvatar:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets contact sources.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#get_sources)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getSources:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets contact sources.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#get_sources)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getSources:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Sets the avatar of the current user.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#set_avatar)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)setAvatar:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Sets the avatar of the current user.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#set_avatar)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)setAvatar:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Fetch a summary of contacts by type.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#summary)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)summary:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Fetch a summary of contacts by type.

 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#summary)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)summary:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns an MFAPIURLRequestConfig object initialized for use with the
 contact/add API.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#add)
 for list of valid parameters.
 */
- (MFAPIURLRequestConfig*)addConf:(NSDictionary*)options query:(NSDictionary*)parameters;

/**
 @brief Returns an MFAPIURLRequestConfig object initialized for use with the
 contact/delete API.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#delete)
 for list of valid parameters.
 */
- (MFAPIURLRequestConfig*)deleteConf:(NSDictionary*)options query:(NSDictionary*)parameters;

/**
 @brief Returns an MFAPIURLRequestConfig object initialized for use with the
 contact/fetch API.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#fetch)
 for list of valid parameters.
 */
- (MFAPIURLRequestConfig*)fetchConf:(NSDictionary*)options query:(NSDictionary*)parameters;

/**
 @brief Returns an MFAPIURLRequestConfig object initialized for use with the
 contact/get_avatar API.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#get_avatar)
 for list of valid parameters.
 */
- (MFAPIURLRequestConfig*)getAvatarConf:(NSDictionary*)options query:(NSDictionary*)parameters;

/**
 @brief Returns an MFAPIURLRequestConfig object initialized for use with the
 contact/get_sources API.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#get_sources)
 for list of valid parameters.
 */
- (MFAPIURLRequestConfig*)getSourcesConf:(NSDictionary*)options query:(NSDictionary*)parameters;

/**
 @brief Returns an MFAPIURLRequestConfig object initialized for use with the
 contact/set_avatar API.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#set_avatar)
 for list of valid parameters.
 */
- (MFAPIURLRequestConfig*)setAvatarConf:(NSDictionary*)options query:(NSDictionary*)parameters;

/**
 @brief Returns an MFAPIURLRequestConfig object initialized for use with the
 contact/summary API.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/contact.php#summary)
 for list of valid parameters.
 */
- (MFAPIURLRequestConfig*)summaryConf:(NSDictionary*)options query:(NSDictionary*)parameters;

@end
