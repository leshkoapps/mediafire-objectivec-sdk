//
//  MFDemoViewController.h
//  MFSDK OSX Demo
//
//  Created by Mike Jablonski on 7/22/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MFDemoViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSTextField* welcomeTextField;
@property (weak) IBOutlet NSTextField* uploadStatusTextField;
@property (weak) IBOutlet NSTextField* uploadNameTextField;
@property (weak) IBOutlet NSTextField* uploadLinkTextField;
@property (weak) IBOutlet NSProgressIndicator* uploadProgressIndicator;
@property (weak) IBOutlet NSTableView* tableView;

- (void)startRequests;

@end
