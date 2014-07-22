//
//  MFUploadViewController.h
//  MFSDK Demo
//
//  Created by Mike Jablonski on 7/21/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFUploadViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) IBOutlet UILabel* statusLabel;
@property (nonatomic, weak) IBOutlet UILabel* fileNameLabel;

- (IBAction)takeAndUploadPhoto:(id)sender;

@end
