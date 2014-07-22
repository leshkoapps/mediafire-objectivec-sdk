//
//  MFUploadTransaction.h
//  MediaFireSDK
//
//  Created by Mike Jablonski on 3/5/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * An MFUploadTransaction uploads a file to the cloud.
 *
 * The desired file's path is passed as an NSString to MFUploadTransaction
 * during initialization. If the file represented by the given file path
 * is not existing or not readable by the app, the upload will fail.
 *
 * To start the upload process, call start or startWithCallbacks. To cancel,
 * call cancel.
 *
 * Callbacks are represented by a NSDictionary with ONLOAD, ONERROR, 
 * ONPROGRESS, ONUPDATE blocks. Each block has a NSDictionary parameter
 * that can expected nested NSDictionaries for following keys: "fileInfo" and
 * "response". The "fileInfo" dictionary contains the following
 * keys: UFILENAME, UFILEHASH, UFILEPATH, USTATUS, UUPLOADKEY, UQUICKKEY, 
 * UUNITCOUNT, UFILESIZE, UUNITSIZE, ULASTUNIT. The objects for these keys
 * are NSNumbers or NSStrings.
 * The "response" dictionary will be an MFErrorMessage or dictionary with
 * key UEVENT (and UCHUNKID key if object for key UEVENT matches UECHUNK).
 * These blocks are called on successful or failed uploads as well as multiple
 * times for status changes. The same callback property may be used for 
 * multiple MFUploadTransactions.
 */

@class MFUploadAPI;

@interface MFUploadTransaction : NSObject

@property (strong,nonatomic) NSString* httpClientId;

- (id)initWithUploadAPI:(MFUploadAPI*)api;
- (id)initWithFilePath:(NSString*)filePath uploadAPI:(MFUploadAPI*)api;
/**
 * Returns a MFUploadTransaction for a file.
 *
 * @param filePath The desired file to be uploaded as a NSString file system 
 * path
 */
- (id)initWithFilePath:(NSString*)filePath;

/**
 * Starts the upload process with callbacks.
 *
 * @param callbacks A NSDictionary with ONLOAD, ONERROR, ONPROGRESS, ONUPDATE 
 * blocks to be called on successful or failed uploads as well as multiple
 * times for status changes. Callback dictionary may be used for multiple
 * MFUploadTransactions.
 */
- (void)startWithCallbacks:(NSDictionary*)callbacks;

/**
 * Starts the upload process.
 */
- (void)start;

/**
 
 * Cancels the upload process. May be restarted with a call to start.
 */
- (void)cancel;

/**
 * Called by internal functions to begin a resumable upload.
 */
- (void)checkUpload;

/**
 * Called by internal functions when a failure happens.
 */
- (void)fail:(NSDictionary*)response;

- (NSDictionary*)optionsForCheckUpload;

- (NSDictionary*)optionsForInstantUpload;

- (NSDictionary*)optionsForResumableUpload;

- (NSDictionary*)parametersForResumableUpload;

- (NSDictionary*)optionsForPollUpload;



@end
