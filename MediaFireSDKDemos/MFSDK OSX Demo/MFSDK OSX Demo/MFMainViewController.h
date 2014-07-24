//
//  MFMainViewController.h
//  MFSDK OSX Demo
//
//  Created by Mike Jablonski on 7/22/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol MFLoginDelegate <NSObject>

- (void)loginCompleted;

@end


@interface MFMainViewController : NSViewController <MFLoginDelegate>

- (void)showLoginView;

@end
