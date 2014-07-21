//
//  MFActionTokenAPI.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/14/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPIBase.h"

@interface MFActionTokenAPI : MFAPIBase

- (void)getActionToken:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;
- (void)getActionToken:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

@end
