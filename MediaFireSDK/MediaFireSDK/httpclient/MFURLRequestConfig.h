//
//  MFURLRequestConfig.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 6/3/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ReferenceCallback) (NSURLSessionTask* connection);
// Success and Failure callbacks use this prototype
typedef void (^OperationBlock)(id response, NSInteger status, NSDictionary * downloaded);
// Progress Callback prototype
typedef void (^ProgressBlock)(double progress);

@class MFURLQuery;

@interface MFURLRequestConfig : NSObject

@property(strong,nonatomic)NSURL* url;
@property(strong,nonatomic)NSString* method;
@property BOOL secure;
@property(strong,nonatomic)NSDictionary* headers;
@property(strong,nonatomic)NSString* query;
@property(strong,nonatomic)NSData* body;
@property(strong,nonatomic)NSURL* localPathForUpload;
@property(strong,nonatomic)NSURL* localPathForDownload;
@property(strong,nonatomic)NSString* description;
@property(strong,nonatomic)NSString* httpClientId;
@property(strong,nonatomic)OperationBlock httpSuccess;
@property(strong,nonatomic)OperationBlock httpFail;
@property(strong,nonatomic)ProgressBlock httpProgress;
@property(strong,nonatomic)ReferenceCallback httpReference;
@end
