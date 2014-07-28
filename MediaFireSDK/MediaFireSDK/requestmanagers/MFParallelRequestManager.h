//
//  MFParallelRequestManager.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 3/3/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFParallelRequestManagerDelegate.h"
#import "MFRequestHandler.h"

@class MFAPIURLRequestConfig;
@class MFActionTokenAPI;

/**
 @brief Handles 'parallel' requests for a specific request type.  Conforms to the MFParallelRequestManagerDelegate protocol.  
 */
@interface MFParallelRequestManager : MFRequestHandler <MFParallelRequestManagerDelegate>

/**
 @brief An instance of the MFActionAPI class.  Can be overidden for custom behaviors.
 */
@property(strong,nonatomic)MFActionTokenAPI* actionAPI;

/**
 @brief Returns an MFParallelRequestManager object initilialized with a given type.  Type can be @"upload" or @"image".
 */
- (id)initWithType:(NSString*)type;

/**
 @brief Puts a request into the queue for dispatching.  If an action token is not set, will first acquire an action token before allowing any requests to proceed.
 
 @param config The configuration object for the request.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)callbacks;

/**
 @brief Causes the request manager to request a new active token.  The request
 manager will automatically request a new active token when it detects that the
 current token has expired.
 */
- (void)askForNewToken;

@end
