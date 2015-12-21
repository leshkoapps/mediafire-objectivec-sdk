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
- (void)cancelPlan:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self cancelPlan:@{} query:parameters callbacks:cb];
}

- (void)cancelPlan:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self createRequest:[self cancelPlanConf:options query:parameters] callbacks:cb];
}

//------------------------------------------------------------------------------
- (void)changePlan:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self changePlan:@{} query:parameters callbacks:cb];
}

- (void)changePlan:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self createRequest:[self changePlanConf:options query:parameters] callbacks:cb];
}

//------------------------------------------------------------------------------
- (void)getInvoice:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self getInvoice:@{} query:parameters callbacks:cb];
}

- (void)getInvoice:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self createRequest:[self getInvoiceConf:options query:parameters] callbacks:cb];
}

//------------------------------------------------------------------------------
- (void)getPlans:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self getPlans:@{} query:parameters callbacks:cb];
}

- (void)getPlans:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self createRequest:[self getPlansConf:options query:parameters] callbacks:cb];
}

//------------------------------------------------------------------------------
- (void)getProducts:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self getProducts:@{} query:parameters callbacks:cb];
}

- (void)getProducts:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self createRequest:[self getProductsConf:options query:parameters] callbacks:cb];
}


//------------------------------------------------------------------------------
- (void)purchasePlan:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self purchasePlan:@{} query:parameters callbacks:cb];
}

- (void)purchasePlan:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self createRequest:[self purchasePlanConf:options query:parameters] callbacks:cb];
}


//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)cancelPlanConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"cancel_plan.php",
                                                          HSECURE : @"true",
                                                          HMETHOD : @"POST"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)changePlanConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"change_plan.php",
                                                          HSECURE : @"true",
                                                          HMETHOD : @"POST"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getInvoiceConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"get_invoice.php",
                                                          HSECURE : @"true",
                                                          HMETHOD : @"POST"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getPlansConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"get_plans.php",
                                                          HSECURE : @"true",
                                                          HMETHOD : @"POST"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getProductsConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"get_products.php",
                                                          HSECURE : @"true",
                                                          HMETHOD : @"POST"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)purchasePlanConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL : @"purchase_plan.php",
                                                          HSECURE : @"true",
                                                          HMETHOD : @"POST"}]
                                   query:parameters];
}


@end
