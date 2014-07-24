//
//  MFLoginViewController.h
//  MFSDK OSX Demo
//
//  Created by Mike Jablonski on 7/22/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MFMainViewController.h"

@interface MFLoginViewController : NSViewController

@property (weak) id<MFLoginDelegate> delegate;
@property (weak) IBOutlet NSTextField* emailTextField;
@property (weak) IBOutlet NSSecureTextField* passwordTextField;
@property (weak) IBOutlet NSButton* loginButton;

@end
