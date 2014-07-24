//
//  MFUserViewController.m
//  MFSDK Demo
//
//  Created by Mike Jablonski on 7/21/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFUserViewController.h"
#import "MediaFireSDK/MediaFireSDK.h"
#import "MediaFireSDK/NSDictionary+Callbacks.h"

@interface MFUserViewController ()

@property (nonatomic, strong) NSArray* userInfoKeys;
@property (nonatomic, strong) NSDictionary* userInfoResults;

@end

@implementation MFUserViewController

//------------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary* userCallbacks =
    @{ONERROR   : ^(NSDictionary* errorResponse) {
        
    },ONLOAD    : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* userInfo = loadResponse[@"user_info"];
            self.userInfoKeys = [userInfo allKeys];
            self.userInfoResults = userInfo;
            
            [self.tableView reloadData];
        });
    }};
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK.UserAPI getInfo:@{} callbacks:userCallbacks];
    });
}

//------------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.userInfoKeys count];
}

//------------------------------------------------------------------------------
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MFUserCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MFUserCell"];
    }
    
    NSString* key = [self.userInfoKeys objectAtIndex:indexPath.row];

    [cell.textLabel setText:key];
    
    id value = self.userInfoResults[key];
    
    if ([value isKindOfClass:[NSString class]]) {
        [cell.detailTextLabel setText:value];
    } else {
        [cell.detailTextLabel setText:@""];
    }
    
    return cell;
}

//------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE]; //Deselect cell
}

@end
