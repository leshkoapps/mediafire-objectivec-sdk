//
//  MFContentsViewController.m
//  MFSDK Demo
//
//  Created by Mike Jablonski on 7/21/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFContentsViewController.h"
#import "MediaFireSDK/MediaFireSDK.h"
#import "MediaFireSDK/NSDictionary+Callbacks.h"

@interface MFContentsViewController ()

@property (nonatomic, strong) NSMutableArray* contentResults;

@end


@implementation MFContentsViewController

//------------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentResults = [[NSMutableArray alloc] init];
    [self requestFolders];
    
}

//------------------------------------------------------------------------------
- (void)requestFolders {
    NSDictionary* contentCallbacks =
    @{ONERROR   : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"[MFSDK Demo] Error getting folder contents. - %@", errorResponse);
        });
    },ONLOAD    : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* folderContent = loadResponse[@"folder_content"];
            NSArray* folders = folderContent[@"folders"];
            
            [self.contentResults addObjectsFromArray:folders];
            [self.tableView reloadData];
            
            [self requestFiles];
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK.FolderAPI getContent:@{@"folder_key" : @"myfiles",
                                             @"content_type" : @"folders",
                                             @"chunk" : @1}
                                 callbacks:contentCallbacks];
    });
}

//------------------------------------------------------------------------------
- (void)requestFiles {
    NSDictionary* contentCallbacks =
    @{ONERROR   : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"[MFSDK Demo] Error getting folder contents. - %@", errorResponse);
        });
    },ONLOAD    : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* folderContent = loadResponse[@"folder_content"];
            NSArray* files = folderContent[@"files"];
            
            [self.contentResults addObjectsFromArray:files];
            [self.tableView reloadData];
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK.FolderAPI getContent:@{@"folder_key" : @"myfiles",
                                             @"content_type" : @"files",
                                             @"chunk" : @1}
                                 callbacks:contentCallbacks];
    });
}

//------------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contentResults count];
}

//------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

//------------------------------------------------------------------------------
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MFContentCell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MFContentCell"];
    }
    
    NSDictionary *content = [self.contentResults objectAtIndex:indexPath.row];
    
    if ([content valueForKey:@"folderkey"] != nil) {
        UIImage* icon = [UIImage imageNamed:@"FolderIcon.png"];
        [cell.imageView setImage:icon];
        
        [cell.textLabel setText:content[@"name"]];
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@ Folders ‧ %@ Files",
                                       content[@"folder_count"],
                                       content[@"file_count"]]];
        
    } else if (content[@"quickkey"] != nil) {
        UIImage* icon = [UIImage imageNamed:@"FileIcon.png"];
        [cell.imageView setImage:icon];
        
        [cell.textLabel setText:content[@"filename"]];
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@  ‧ %@",
                                       [[content valueForKey:@"privacy"] capitalizedString],
                                       [content valueForKey:@"created"]]];

    }
    
    return cell;
}

//------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
}

@end
