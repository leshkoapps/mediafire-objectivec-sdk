//
//  NSMutableURLRequest+Auth.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 7/28/15.
//  Copyright (c) 2015 MediaFire. All rights reserved.
//

#import "NSMutableURLRequest+Auth.h"
#import "MFEncode.h"

@implementation NSMutableURLRequest (Auth)

- (void)addAuthenticationHeaderWithUser:(NSString*)user password:(NSString*)password {
    NSString* authStr = [NSString stringWithFormat:@"%@:%@", user, password];
    NSData* authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString* authValue = [NSString stringWithFormat:@"Basic %@", [MFEncode dataToBase64:authData]];
    [self setValue:authValue forHTTPHeaderField:@"Authorization"];
}

@end
