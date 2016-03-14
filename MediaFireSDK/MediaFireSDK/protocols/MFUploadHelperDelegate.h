//
//  MFUploadHelperDelegate.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 11/6/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFUploadFileInfo.h"

// Error codes
typedef NS_ENUM(NSInteger, MFUploadHelperErr) {
    MFUploadHelperErrUnknown = 0,
    MFUploadHelperErrFileNotFound = 15001,
    MFUploadHelperErrParameterInvalid = 15002,
    MFUploadHelperErrHashFailed = 15003,
    MFUploadHelperErrInternal = 15004
};

typedef void (^MFUploadFilePrepCallback)(MFUploadFileInfo*, NSError*);

@protocol MFUploadHelperDelegate <NSObject>

/*
 @brief Returns a block of data from the file identified by a given set of 
 metadata.
 
 @param chunkNumber The chunk to be returned.  The number of chunks and size of
 the chunks will have been provided already to the delegate in the
 prepareFileForUpload:withCompletionHandler: method.
 @param fileInfo A dictionary containing metadata relevant to the file that
 the chunk is expected from.
 */
- (NSData*)getChunk:(int)chunkNumber forFile:(NSDictionary*)fileInfo;

/*
 @brief Triggered when an upload transaction is started.  Implement the details
 of file retrieval in this delegate method, whether the file is coming from a
 standard filesystem, out of a database, as a stream from another source, etc.
 
 @param fileInfo A dictionary containing metadata relevant to the file that
 is to be uploaded.
 @param block A completion handler that must be called when done.
 */
- (void)prepareFileForUpload:(NSDictionary*)fileInfo withCompletionHandler:(MFUploadFilePrepCallback)block;

@optional

/*
 @brief Triggered when an upload completes either successfully or unsuccessfully.
 
 @param fileInfo A dictionary containing metadata relevant to the file that 
 completed its upload.
 @param result A container for result information.  Currently only contains a
 UESTATUS key which can have a value of UESUCCESS or UEFAIL
 */
- (void)uploadDidCompleteForFile:(NSDictionary*)fileInfo withResult:(NSDictionary*)result;

@end
