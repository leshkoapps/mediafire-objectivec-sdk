//
//  MFAPIURLRequestConfig.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/3/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFURLRequestConfig.h"


typedef NS_ENUM(NSUInteger, RequestTokenType) {
    MFTOKEN_SERIAL = 0,
    MFTOKEN_NONE = 1,
    MFTOKEN_PARALLEL_UPLOAD = 2,
    MFTOKEN_PARALLEL_IMAGE = 3
};


@interface MFAPIURLRequestConfig : MFURLRequestConfig

@property RequestTokenType tokenType;
@property(strong,nonatomic)NSDictionary* queryDict;
@property(strong,nonatomic)NSString* location;
@property(strong,nonatomic)NSString* host;

- (id)initWithOptions:(NSDictionary *)options query:(NSDictionary *)params;
- (NSURL*)generateURL;

@end
