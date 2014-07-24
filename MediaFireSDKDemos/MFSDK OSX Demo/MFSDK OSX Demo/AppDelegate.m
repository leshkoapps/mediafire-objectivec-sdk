//
//  AppDelegate.m
//  MFSDK OSX Demo
//
//  Created by Mike Jablonski on 7/22/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "AppDelegate.h"
#import "MediaFireSDK/MediaFireSDK.h"
#import "MFMainViewController.h"

@interface AppDelegate()

@property (strong) MFMainViewController* mainViewController;

@end


@implementation AppDelegate

//------------------------------------------------------------------------------
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Enter your MediaFire app id and api key. Visit https://www.mediafire.com/developers to create a
    // developer profile and generate your api key and app id.
    NSString* appID = @"<your app id>";
    NSString* apiKey = @"<your api key>"; // May be blank if "Require Secret Key" is disabled.
    
    [MediaFireSDK createWithConfig:@{@"app_id"  : appID,
                                     @"api_key" : apiKey}];
    
    // Just a friendly config check
    if ([appID isEqualToString:@"<your app id>"] || [apiKey isEqualToString:@"<your api id>"]) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"MediaFire Config Error"];
        [alert setInformativeText:@"Please enter your app id and api key in AppDelegate.m"];
        [alert setAlertStyle:NSWarningAlertStyle];
        
        [alert runModal];
    }
    
    [self.window setContentSize:NSMakeSize(750,500)];
    [self.window setContentMinSize:NSMakeSize(750,500)];
    
    self.mainViewController = [[MFMainViewController alloc] initWithNibName:@"MFMainViewController" bundle:nil];
    [self.mainViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.window.contentView addSubview:self.mainViewController.view];
    
    [self.window.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.mainViewController.view
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.window.contentView
                                  attribute:NSLayoutAttributeWidth
                                 multiplier:1
                                   constant:0]];
    
    [self.window.contentView  addConstraint:
     [NSLayoutConstraint constraintWithItem:self.mainViewController.view
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.window.contentView
                                  attribute:NSLayoutAttributeHeight
                                 multiplier:1
                                   constant:0]];
    
    [self.mainViewController showLoginView];
}

//------------------------------------------------------------------------------
extern void MFCaptureLogMessage(NSString* message) {
    // Use this method to capture log messages from MediaFire SDK.
}

@end
