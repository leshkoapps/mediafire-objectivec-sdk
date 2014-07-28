//
//  MFLoginViewController.h
//  MFSDK Demo
//
//  Created by Mike Jablonski on 7/21/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFLoginViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UIButton* loginButton;
@property (nonatomic, weak) IBOutlet UIButton* continueButton;

- (IBAction)login:(id)sender;

@end
