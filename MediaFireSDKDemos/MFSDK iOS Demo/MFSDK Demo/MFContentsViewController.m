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
@property (nonatomic, strong) UIRefreshControl* refreshControl;

@end


@implementation MFContentsViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        [self customInit];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if(self){
        [self customInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self customInit];
    }
    return self;
}

- (void)customInit{
    self.folderKey = @"myfiles";
}

//------------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.tableView==nil){
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:self.tableView];
    }
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
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
            
            if ([folders count] == 100) {
                [self.contentResults addObject:@{@"text" : @"More folders in cloud", @"detailText" : @"Only loading first 100"}];
            }
            
            [self.tableView reloadData];
            
            [self requestFiles];
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK.FolderAPI getContent:@{@"folder_key" : self.folderKey,
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
            
            if ([files count] == 100) {
                [self.contentResults addObject:@{@"text" : @"More files in cloud", @"detailText" : @"Only loading first 100"}];
            }
            
            [self.tableView reloadData];
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK.FolderAPI getContent:@{@"folder_key" : self.folderKey,
                                             @"content_type" : @"files",
                                             @"chunk" : @1}
                                 callbacks:contentCallbacks];
    });
}

//------------------------------------------------------------------------------
- (void)refresh:(UIRefreshControl *)senderRefreshControl {
    [senderRefreshControl beginRefreshing];
    
    [self.contentResults removeAllObjects];
    [self.tableView reloadData];
    
    [senderRefreshControl endRefreshing];
    
    [self requestFolders];
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
    
    if (content[@"folderkey"] != nil) {
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

    } else {
        [cell.imageView setImage:nil];
        [cell.textLabel setText:content[@"text"]];
        [cell.detailTextLabel setText:content[@"detailText"]];
    }
    
    return cell;
}

//------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    NSDictionary *content = [self.contentResults objectAtIndex:indexPath.row];
    
    if (content[@"folderkey"] != nil) {
        NSString *folderName = content[@"folderkey"];
        MFContentsViewController *vc = [[MFContentsViewController alloc] init];
        vc.folderKey = folderName;
        [self.navigationController pushViewController:vc animated:YES];
        
    }

}

@end
