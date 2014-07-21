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

@interface MFParallelRequestManager : MFRequestHandler <MFParallelRequestManagerDelegate>

@property(strong,nonatomic)MFActionTokenAPI* actionAPI;

- (id)initWithType:(NSString*)type;

- (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)callbacks;

/**
 @brief Causes the request manager to request a new active token.  The request
 manager will automatically request a new active token when it detects that the
 current token has expired.
 */
- (void)askForNewToken;

@end
