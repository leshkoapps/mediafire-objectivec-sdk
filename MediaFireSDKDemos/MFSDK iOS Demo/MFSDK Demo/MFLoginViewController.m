//
//  MFLoginViewController.m
//  MFSDK Demo
//
//  Created by Mike Jablonski on 7/21/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFLoginViewController.h"
#import "MediaFireSDK/MediaFireSDK.h"
#import "MediaFireSDK/NSDictionary+Callbacks.h"

@interface MFLoginViewController ()

@end


@implementation MFLoginViewController

//------------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//------------------------------------------------------------------------------
- (void)showLoginError {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MediaFire Login Error"
                                                    message:@"Error logging in to your MediaFire account. Please ensure your email address and password are correct."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
}

//------------------------------------------------------------------------------
- (IBAction)login:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"MediaFire Login"
                                                    message:@"Enter your email address and password associated with your MediaFire account."
                                                   delegate:self
                                          cancelButtonTitle:@"Login"
                                          otherButtonTitles:nil];
    
    [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    [alert show];
}

//------------------------------------------------------------------------------
- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    UITextField* emailField = [alertView textFieldAtIndex:0];
    UITextField* passwordField = [alertView textFieldAtIndex:1];
    
    NSDictionary* sessionCallbacks =
    @{ONERROR : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"[MFSDK Demo] Error starting MediaFire session. - %@", errorResponse);
            
            [self showLoginError];
        });
    },ONLOAD  : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.loginButton setHidden:TRUE];
            [self.continueButton setHidden:FALSE];
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *email = emailField.text;
        NSString *password = passwordField.text;
        [MediaFireSDK startSession:email withPassword:password andCallbacks:sessionCallbacks];
    });
}

@end
