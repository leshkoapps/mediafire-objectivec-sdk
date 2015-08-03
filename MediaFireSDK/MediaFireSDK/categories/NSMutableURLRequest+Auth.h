//
//  NSMutableURLRequest+Auth.h
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/28/15.
//  Copyright (c) 2015 MediaFire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (Auth)

/*
 @brief Adds a basic HTTP header to the request.
 
 @param user The user value for the authentication.
 @param password The password value for the authentication.
 */
- (void)addAuthenticationHeaderWithUser:(NSString*)user password:(NSString*)password;
@end
