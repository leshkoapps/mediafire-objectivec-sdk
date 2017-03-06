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
@class MFHTTP;

@protocol MFParallelRequestManagerDelegate <NSObject>

@property(strong,nonatomic)MFActionTokenAPI* actionAPI;

- (id)initWithType:(NSString*)type http:(MFHTTP *)http;

- (void)createRequest:(MFAPIURLRequestConfig*)config callbacks:(NSDictionary*)callbacks;

- (void)askForNewToken;

- (void)endSession;

@end
