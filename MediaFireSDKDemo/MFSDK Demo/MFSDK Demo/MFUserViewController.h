//
//  MFUserViewController.h
//  MFSDK Demo
//
//  Created by Mike Jablonski on 7/21/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFUserViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView* tableView;

@end
