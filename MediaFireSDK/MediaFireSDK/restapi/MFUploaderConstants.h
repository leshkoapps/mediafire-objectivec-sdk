//
//  MFUploaderConstants.h
//  MediaFireSDK
//
//  Created by Mike Jablonski on 3/5/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

// Event and status names for upload transaction
extern NSString* const UEVENT;   // Upload Event keyword
extern NSString* const UESETUP;  // Upload Event : Pre Upload Complete.
extern NSString* const UECHUNK;  // Upload Event : A unit was uploaded successfully.
extern NSString* const UECHUNKS; // Upload Event : All units uploaded successfully.
extern NSString* const UEPOLL;   // Upload Event : Poll Upload success, no key yet.
extern NSString* const UEHANG;   // Upload Event : Non-fatal error (Poll Upload).
extern NSString* const UCHUNKID; // Unit ID keyword

// Field names for upload info.
extern NSString* const UQUICKKEY;
extern NSString* const UFILENAME;
extern NSString* const UFILEPATH;
extern NSString* const UUPLOADDATA;
extern NSString* const UFILEHASH;
extern NSString* const UUPLOADKEY;
extern NSString* const UFOLDERKEY;
extern NSString* const USTATUS;
extern NSString* const UFILESIZE;
extern NSString* const ULASTUNIT;
extern NSString* const UUNITSIZE;
extern NSString* const UUNITCOUNT;