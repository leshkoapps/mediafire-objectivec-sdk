//
//  MFMediaAPI.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/2/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFMediaAPI : NSObject

+ (NSString*)generateConversionServerURL:(NSString *)baseUrlString withHash:(NSString *)hash withParameters:(NSDictionary *)params;

- (NSString*)getPreviewURL:(NSDictionary*)parameters withHash:(NSString*)hash;

- (void)getPreviewBinary:(NSDictionary*)parameters hash:(NSString*)hash callbacks:(NSDictionary*)callbacks;
- (void)getPreviewBinary:(NSDictionary*)options query:(NSDictionary*)parameters hash:(NSString*)hash callbacks:(NSDictionary*)callbacks;

- (void)getPreviewBinaryCachedPath:(NSDictionary*)parameters hash:(NSString*)hash callbacks:(NSDictionary*)callbacks;
- (void)getPreviewBinaryCachedPath:(NSDictionary*)options query:(NSDictionary*)parameters hash:(NSString*)hash callbacks:(NSDictionary*)callbacks;

- (void)directDownload:(NSURL*)url callbacks:(NSDictionary*)callbacks;

@end
