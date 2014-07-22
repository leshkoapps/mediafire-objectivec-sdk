//
//  NSDictionary+Callbacks.h
//  MediaFireSDK
//
//  Created by Ken Hartness on 7/30/13.
//  Copyright (c) 2013 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MFCallback)(NSDictionary * response);
typedef void (^MFProgressCallback)(double progress);

extern const NSString* ONLOAD;
extern const NSString* ONERROR;
extern const NSString* ONPROGRESS;
extern const NSString* ONUPDATE;

@interface NSDictionary (Callbacks)

/**
 @brief A success callback.
 */
@property (nonatomic, readonly) MFCallback onload;

/**
 @brief A failure callback.
 */
@property (nonatomic, readonly) MFCallback onerror;

/**
 @brief A progress callback.  Intended for rapid calls, for file transfer 
 progress indication.
 */
@property (nonatomic, readonly) MFProgressCallback onprogress;

/**
 @brief An update callback.  Similar to onprogress but uses the MFCallback
 style, not intended for rapid calls.  Used as an alternative to NSNotification.
 */
@property (nonatomic, readonly) MFCallback onupdate;
@end
