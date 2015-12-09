//
//  MFAPIURLRequestHandlerDelegate.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 11/13/15.
//  Copyright © 2015 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 @brief Defines the interface for handling MFAPI URL requests.
*/

@class MFAPIURLRequestConfig;

@protocol MFAPIURLRequestHandlerDelegate <NSObject>

/*
 @brief creates and executes a URL request using the given request config.

 @param config The request config used to construct the request.

 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
*/
- (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)cb;

@end
