//
//  MFConfig.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 3/6/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFCredentials.h"
/**
 @brief The global configuration interface for the MediaFireSDK.
 */
@interface MFConfig : NSObject

/**
 @brief The application ID.
 */
@property(nonatomic) NSString* appId;
/**
 @brief The application's API key.  Depending on the app settings in the MediaFire developer portal, this value may be optional.
 */
@property(nonatomic) NSString* apiKey;
/**
 @brief The maximum number of session tokens for the Serial Request Manager to reserve.
 */
@property(nonatomic) NSUInteger maxTokens;
/**
 @brief The minimum number of session tokens for the Serial Request Manager to reserve.
 */
@property(nonatomic) NSUInteger minTokens;

/**
 @brief Initializes the shared instance with given configuration.
 
 @param config Dictionary containing app-specific configuration.
 */
+ (void)createWithConfig:(NSDictionary*)config;

/**
 @brief Returns the MFConfig shared instance.
*/
+ (MFConfig*)instance;

/**
 @brief Destroys the MFConfig shared instance.
 */
+ (void)destroy;

/**
 @brief Returns the class of the currently registered credentials delegate.
 */
+ (Class)credentialsDelegate;

/**
 @brief Returns the class of the currently registered Parallel Request Manager delegate.
 */
+ (Class)parallelRequestDelegate;

/**
 @brief Returns the class of the currently registered Serial Request Manager delegate.
 */
+ (Class)serialRequestDelegate;

/**
 @brief Returns the defaul API version that this version of the SDK defaults to.
 */
+ (NSString*)defaultAPIVersion;

/**
 @brief Stores a reference by name (clientId) that subsequent API requests can be directed thru using the 'options' dictionary.
 
 @param client An initialized object that conforms to the MFHTTPClientDelegate protocol.
 
 @param clientId A unique name for the supplied client that can be used in API requests to route them thru the supplied client.
 */
+ (BOOL)registerHTTPClient:(id)client withId:(NSString*)clientId;

/**
 @brief Removes reference to the named client, and calls the client's 'destroy' delegate method.
 
 @param clientId The unique name of the client.
 */
+ (BOOL)unregisterHTTPClient:(NSString*)clientId;

/**
 @brief Resturns the client identified by the unique name in clientId.
 
 @param clientId The client's unique name.
 */
+ (id)httpClientById:(NSString*)clientId;

/**
 @brief Calls 'showNetworkIndicator' on the Network Indicator Delegate if one was supplied to MFConfig in createWithConfig:.
 */
+ (void)showNetworkIndicator;

/**
 @brief Calls 'hideNetworkIndicator' on the Network Indicator Delegate if one was supplied to MFConfig in createWithConfig:.
 */
+ (void)hideNetworkIndicator;

/**
 @brief Returns the SDK's default http client.  If no http client config was supplied to MFConfig in createWithConfig: then this function will return [NSURLSession sharedSession].
 */
+ (NSURLSession*)defaultHttpClient;

@end
