//
//  MFRequestHandler.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/7/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MFAPIURLRequestConfig;

@interface MFRequestHandler : NSObject

+ (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)callbacks;

+ (NSDictionary*)getCallbacksForRequest:(NSURL*)url callbacks:(NSDictionary*)callbacks;

@end
