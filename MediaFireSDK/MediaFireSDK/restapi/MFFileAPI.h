//
//  MFFileAPI.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 2/25/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPI.h"

/**
 @brief The interface for conducting file operations.
 */

@interface MFFileAPI : MFAPI

- (id)initWithRequestManager:(MFRequestManager *)requestManager;
- (id)initWithVersion:(NSString*)version requestManager:(MFRequestManager *)requestManager;


/**
 @brief Allows configuring/modifying the options related to an existing one-time
 download link.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#configure_one_time_download)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)configureOneTimeDownload:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Allows configuring/modifying the options related to an existing one-time 
 download link.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#configure_one_time_download)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)configureOneTimeDownload:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Copy a file to a specified folder.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#copy)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)copy:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Copy a file to a specified folder.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#copy)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)copy:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Creates a file.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#create)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)create:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Creates a file.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#create)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)create:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Creates a duplicate of a file as a new revision.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#create_snapshot)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)createSnapshot:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Creates a duplicate of a file as a new revision.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#create_snapshot)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)createSnapshot:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Delete a user's file. The file is moved to the Trash Can.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#delete)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)delete:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Delete a user's file. The file is moved to the Trash Can.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#delete)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)delete:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns a bitmask value of special information about a file.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#get_flags)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getFlags:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns a bitmask value of special information about a file.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#get_flags)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getFlags:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Returns a list of the a file's details.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#get_info)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getInfo:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns a list of the a file's details.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#get_info)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getInfo:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns the view link, normal download link, and, if possible, the 
 direct download link of a file.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#links)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getLinks:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns the view link, normal download link, and, if possible, the
 direct download link of a file.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#links)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getLinks:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns the status of a document or an image.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#get_status)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getStatus:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns the status of a document or an image.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#get_status)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getStatus:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Returns a list of all file versions.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#get_versions)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getVersions:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns a list of all file versions.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#get_versions)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getVersions:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Move a file, or list of files, to a folder.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#move)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)move:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Move a file, or list of files, to a folder.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#move)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)move:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Creates a one-time download link.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#one_time_download)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)oneTimeDownload:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Creates a one-time download link.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#one_time_download)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)oneTimeDownload:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Permanently delete a user's file.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#purge)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)purge:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Permanently delete a user's file.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#purge)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)purge:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Returns a list of quickkeys of the recently modified files.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#recently_modified)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)recentlyModified:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns a list of quickkeys of the recently modified files.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#recently_modified)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)recentlyModified:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Restores an old file revision and makes it the current head.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#restore)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)restore:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Restores an old file revision and makes it the current head.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#restore)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)restore:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Sets the bits in the file's flags.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#set_flags)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)setFlags:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Sets the bits in the file's flags.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#set_flags)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */- (void)setFlags:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Update a file's information.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#update)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)update:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Update a file's information.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#update)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)update:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Update a file's quickkey with another file's quickkey.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#update_file)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)updateFile:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Update a file's quickkey with another file's quickkey.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#update_file)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)updateFile:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Update a file's password.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#update_password)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)updatePassword:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Update a file's password.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#update_password)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)updatePassword:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;


/**
 @brief Bulk-download multiple files and folders into one single zip file.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#zip)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)zip:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Bulk-download multiple files and folders into one single zip file.
 
 @param options Dictionary with HTTP client options.  See MFHTTPOptions.h for list of valid parameters.

 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.0/file.php#zip)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)zip:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

@end
