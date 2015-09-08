//
//  BillingAPI.m
//  MediaFireSDK
//
//  Created by Mike Jablonski on 7/7/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFBillingAPI.h"
#import "MFConfig.h"
#import "NSDictionary+MapObject.h"
#import "MFHTTPOptions.h"

@implementation MFBillingAPI

//------------------------------------------------------------------------------
- (id)init {
    self = [self initWithVersion:[MFConfig defaultAPIVersion]];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (id)initWithVersion:(NSString*)version {
    self = [super initWithPath:@"billing" version:version];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (void)purchasePlan:(NSDictionary*)parameters withCallbacks:(NSDictionary*)cb {
    [self purchasePlan:@{} query:parameters withCallbacks:cb];
}

- (void)purchasePlan:(NSDictionary*)options query:(NSDictionary*)parameters withCallbacks:(NSDictionary*)cb {
    [self createRequest:[options merge:@{HURL : @"purchase_plan.php",
                                         HSECURE : @"true",
                                         HMETHOD : @"POST"}]
                  query:parameters
              callbacks:cb];
}


@end
