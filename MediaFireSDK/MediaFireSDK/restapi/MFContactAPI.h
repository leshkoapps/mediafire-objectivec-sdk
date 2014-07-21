//
//  MFContactAPI.h
//  MediaFireSDK
//
//  Created by Mike Jablonski on 3/19/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPI.h"

@interface MFContactAPI : MFAPI

- (id)initWithVersion:(NSString*)version;
- (void)add:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)add:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)delete:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;
- (void)delete:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb;

@end
