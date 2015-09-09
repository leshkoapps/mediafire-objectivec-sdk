//
//  BillingAPI.h
//  MediaFireSDK
//
//  Created by Mike Jablonski on 7/7/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFAPI.h"

@interface MFBillingAPI : MFAPI

/**
 @brief Returns an MFSoftwareAPI object initialized with a given API version
 number.
 
 @param version The version of the MediaFire API that the instance will default
 to.
 */
- (id)initWithVersion:(NSString*)version;

/**
 @brief Cancels the active invoice for a plan.  Access to this API is restricted.
 If you would like to use this API, contact MediaFire support.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#cancel_plan)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)cancelPlan:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Cancels the active invoice for a plan.  Access to this API is restricted.
 If you would like to use this API, contact MediaFire support.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for
 list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#cancel_plan)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)cancelPlan:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets a new billing date for the current plan.  Access to this API is
 restricted.  If you would like to use this API, contact MediaFire support.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#change_plan)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)changePlan:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets a new billing date for the current plan.  Access to this API is 
 restricted.  If you would like to use this API, contact MediaFire support.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for
 list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#change_plan)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)changePlan:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets contents of the most recent invoice.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#get_invoice)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getInvoice:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets contents of the most recent invoice.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for
 list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#get_invoice)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getInvoice:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets a list of active plans.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#get_plans)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getPlans:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Gets a list of active plans.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for
 list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#get_plans)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getPlans:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns plan information based on input.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#get_products)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getProducts:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Returns plan information based on input.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for
 list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#get_products)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)getProducts:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Purchases a plan for the current user.  Access to this API is restricted.
 If you would like to use this API, contact MediaFire support.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#purchase_plan)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)purchasePlan:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

/**
 @brief Purchases a plan for the current user.  Access to this API is restricted.
 If you would like to use this API, contact MediaFire support.
 
 @param options Dictionary with HTTP client options. See MFHTTPOptions.h for
 list of valid parameters.
 
 @param parameters Dictionary with API parameter options. See
 [Developer Documentation](https://www.mediafire.com/developers/core_api/1.4/billing/#purchase_plan)
 for list of valid parameters.
 
 @param callbacks A dictionary containing an onload callback and onerror
 callback. See NSDictionary(Callbacks).
 */
- (void)purchasePlan:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks;

@end
