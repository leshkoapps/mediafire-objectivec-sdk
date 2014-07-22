//
//  DeviceAPI.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 4/4/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPI.h"

@interface MFDeviceAPI : MFAPI

- (id)initWithVersion:(NSString*)version;

/**
 @brief Gets a list of files and folders with revisions greater than the 
 revision supplied by the client, up to the next 500-multiplier.
 
 @param options Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#get_changes )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getChanges:(NSDictionary*)options callbacks:(NSDictionary*)cb;
- (void)getChanges:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Gets a pair of lists representing the files and folders that have been
 shared to the current user from other users.
 
 @param options Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#get_foreign_resources )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getForeignResources:(NSDictionary*)options callbacks:(NSDictionary*)cb;
- (void)getForeignResources:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Gets a download link for the patch specified by the client.
 
 @param options Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#get_patch )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getPatch:(NSDictionary*)options callbacks:(NSDictionary*)cb;
- (void)getPatch:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Gets a list of contacts, along with their permissions, of a shared
 file or folder.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#get_resource_shares )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getResourceShares:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)getResourceShares:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Gedts revision and async job status for the device id supplied by the
 client.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#get_status )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getStatus:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)getStatus:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Returns the trash can folder data and the list of immediate files and
 folders in the trash can. Contents of subfolders in the trash can will not be
 returned.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#get_trash )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getTrash:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)getTrash:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Gets a list of patches applied to the file specified by the client.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#get_updates )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getUpdates:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)getUpdates:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Gets a list of all items the current user account has shared, and the 
 contacts to which those items have been shared.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#get_user_shares )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getUserShares:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)getUserShares:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Authorizes 1 or more contacts with access to one or more items in the
 current user's account, where the client provides contact ids, resource ids,
 and the respective permission levels associated with each contact-resource pair.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#share_resources )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)shareResources:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)shareResources:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Deauthorizes all or a select few contacts from accessing a resource that
 was previously shared.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#unshare_resource )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)unshareResources:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)unshareResources:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Adds a folderkey/quickkey supplied by the client to the client's
 list of followed items (foreign resources).
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#unfollow_resource )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)followResource:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)followResource:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

/**
 @brief Removes a folderkey/quickkey supplied by the client from the client's
 list of followed items (foreign resources).
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](http://mediafire.com/developers/device.php#unfollow_resource )
 for list of valid parameters.
 
 @param cb A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)unfollowResource:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)unfollowResource:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

@end
