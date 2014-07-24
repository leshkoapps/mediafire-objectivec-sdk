//
//  MFMainViewController.m
//  MFSDK OSX Demo
//
//  Created by Mike Jablonski on 7/22/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFMainViewController.h"
#import "MFLoginViewController.h"
#import "MFDemoViewController.h"

@interface MFMainViewController ()

@property (strong) MFLoginViewController* loginViewController;
@property (strong) MFDemoViewController* uploadViewController;

@end


@implementation MFMainViewController

//------------------------------------------------------------------------------
- (void)showLoginView {
    self.loginViewController = [[MFLoginViewController alloc] initWithNibName:@"MFLoginViewController" bundle:nil];
    [self.loginViewController setDelegate:self];
    [self.loginViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:self.loginViewController.view];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.loginViewController.view
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeWidth
                                 multiplier:1
                                   constant:0]];
    
    [self.view  addConstraint:
     [NSLayoutConstraint constraintWithItem:self.loginViewController.view
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeHeight
                                 multiplier:1
                                   constant:0]];

    
}

//------------------------------------------------------------------------------
- (void)removeLoginView {
    [self.loginViewController.view removeFromSuperview];
}

//------------------------------------------------------------------------------
- (void)loginCompleted {
    [self removeLoginView];
    [self showUploadView];
}

//------------------------------------------------------------------------------
- (void)showUploadView {
    self.uploadViewController = [[MFDemoViewController alloc] initWithNibName:@"MFDemoViewController" bundle:nil];
    [self.uploadViewController startRequests];
    [self.uploadViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:self.uploadViewController.view];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.uploadViewController.view
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeWidth
                                 multiplier:1
                                   constant:0]];
    
    [self.view  addConstraint:
     [NSLayoutConstraint constraintWithItem:self.uploadViewController.view
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeHeight
                                 multiplier:1
                                   constant:0]];
}

@end
