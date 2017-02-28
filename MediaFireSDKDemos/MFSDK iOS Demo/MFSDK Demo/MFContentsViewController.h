//
//  MFContentsViewController.h
//  MFSDK Demo
//
//  Created by Mike Jablonski on 7/21/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFContentsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView* tableView;

@property (nonatomic,copy)NSString *folderKey;

@end
