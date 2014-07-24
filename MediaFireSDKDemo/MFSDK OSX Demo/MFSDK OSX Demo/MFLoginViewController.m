//
//  MFLoginViewController.m
//  MFSDK OSX Demo
//
//  Created by Mike Jablonski on 7/22/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFLoginViewController.h"
#import "MFDemoViewController.h"
#import "MediaFireSDK/MediaFireSDK.h"
#import "MediaFireSDK/NSDictionary+Callbacks.h"

@interface MFLoginViewController ()

@end


@implementation MFLoginViewController

//------------------------------------------------------------------------------
- (void)showLoginError {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"MediaFire Login Error"];
    [alert setInformativeText:@"Error logging in to your MediaFire account. Please ensure your email address and password are correct."];
    [alert setAlertStyle:NSWarningAlertStyle];
    
    [alert runModal];
}

//------------------------------------------------------------------------------
- (IBAction)login:(id)sender {
    [self.loginButton setTitle:@"Logging in..."];
    
    NSDictionary* sessionCallbacks =
    @{ONERROR : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"[MFSDK OSX Demo] Error starting MediaFire session. - %@", errorResponse);
            
            [self showLoginError];
            [self.loginButton setTitle:@"Login"];
        });
    },ONLOAD  : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate loginCompleted];
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK startSession:[self.emailTextField stringValue]
                      withPassword:[self.passwordTextField stringValue]
                      andCallbacks:sessionCallbacks];
    });
}

@end
