//
//  AppDelegate.m
//  MFSDK Demo
//
//  Created by Mike Jablonski on 7/21/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "AppDelegate.h"
#import "MediaFireSDK/MediaFireSDK.h"

@implementation AppDelegate

//------------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Enter your MediaFire app id and api key. Visit https://www.mediafire.com/developers to create a
    // developer profile and generate your api key and app id.
    NSString* appID = @"<your app id>";
    NSString* apiKey = @"<your api key>";
    
    [MediaFireSDK createWithConfig:@{@"app_id"  : appID,
                                     @"api_key" : apiKey}];
    
    
    // Just a friendly config check
    if ([appID isEqualToString:@"<your app id>"] || [apiKey isEqualToString:@"<your api id>"]) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"MediaFire Config Error"
                                                        message:@"Please enter your app id and api key in AppDelegate.m"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
    
    return YES;
}

//------------------------------------------------------------------------------
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//------------------------------------------------------------------------------
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//------------------------------------------------------------------------------
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//------------------------------------------------------------------------------
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//------------------------------------------------------------------------------
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//------------------------------------------------------------------------------
extern void MFCaptureLogMessage(NSString* message) {
    // Use this method to capture log messages from MediaFire SDK.
}

@end
