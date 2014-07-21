//
//  MFUploadAPI.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 2/25/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPI.h"

@interface MFUploadAPI : MFAPI

- (id)initWithVersion:(NSString*)version;

- (void)check:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;
- (void)check:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

- (void)instant:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;
- (void)instant:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

- (void)uploadFile:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

- (void)uploadUnit:(NSDictionary*)fileInfo query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

- (void)uploadUnit:(NSDictionary*)options fileInfo:(NSDictionary*)fileInfo query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

- (void)upload:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

- (void)pollUpload:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;
- (void)pollUpload:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

@end
