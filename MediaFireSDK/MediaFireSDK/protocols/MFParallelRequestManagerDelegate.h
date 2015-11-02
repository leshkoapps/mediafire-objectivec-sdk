//
//  MFParallelRequestManagerDelegate.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 4/15/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MFAPIURLRequestConfig;
@class MFActionTokenAPI;

@protocol MFParallelRequestManagerDelegate <NSObject>
@property(strong,nonatomic)MFActionTokenAPI* actionAPI;

- (id)initWithType:(NSString*)type;
- (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)callbacks;
- (void)askForNewToken;
- (void)endSession;

/*
 @brief Sets the lifespan of the next requested action token.
 
 @param lifespan The expected lifespan of the token, in seconds.
 */
- (void)setTokenLifespan:(NSUInteger)lifespan;
@end
