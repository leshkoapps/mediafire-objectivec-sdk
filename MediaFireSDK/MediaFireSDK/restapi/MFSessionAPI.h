//
//  MFSessionAPI.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/10/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPIBase.h"

@interface MFSessionAPI : MFAPIBase

- (id)initWithVersion:(NSString*)version;

- (void)getSessionToken:(NSDictionary*)credentials callbacks:(NSDictionary*)callbacks;

- (void)getSessionToken:(NSDictionary*)options query:(NSDictionary*)credentials callbacks:(NSDictionary*)callbacks;

@end
