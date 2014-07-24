//
//  MFDemoViewController.m
//  MFSDK OSX Demo
//
//  Created by Mike Jablonski on 7/22/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFDemoViewController.h"
#import "MediaFireSDK/MediaFireSDK.h"
#import "MediaFireSDK/NSDictionary+Callbacks.h"
#import "MediaFireSDK/MFUploaderConstants.h"
#import "MediaFireSDK/MFUploadTransaction.h"

@interface MFDemoViewController ()

@property (nonatomic, strong) NSMutableArray* contentResults;

@end


@implementation MFDemoViewController

//----------------------------------------------------------------------------
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _contentResults = [[NSMutableArray alloc] init];
    }
    return self;
}

//============================================================================
// API Requests
//============================================================================
//----------------------------------------------------------------------------
- (void)startRequests {
    [self requestWelcomeText];
    [self requestFoldersChunk:1];
}

//------------------------------------------------------------------------------
- (void)requestWelcomeText {
    NSDictionary* userCallbacks =
    @{ONERROR   : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"[MFSDK OSX Demo] Error getting user info. - %@", errorResponse);
        });
    },ONLOAD    : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* userInfo = loadResponse[@"user_info"];
            NSString* displayName = userInfo[@"display_name"];
            
            [self.welcomeTextField setStringValue:[NSString stringWithFormat:@"Hello, %@!", displayName]];
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK.UserAPI getInfo:@{} callbacks:userCallbacks];
    });
}

//------------------------------------------------------------------------------
- (void)requestLinkForQuickkey:(NSString*)quickkey {
    NSDictionary* linkCallbacks =
    @{ONERROR   : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"[MFSDK OSX Demo] Error getting link. - %@", errorResponse);
        });
    },ONLOAD    : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSArray* linksList = loadResponse[@"links"];
            NSString* link = [linksList firstObject][@"normal_download"];
            
            [self.uploadLinkTextField setAllowsEditingTextAttributes:TRUE];
            [self.uploadLinkTextField setSelectable:TRUE];
            
            NSMutableAttributedString* attributedLink = [[NSMutableAttributedString alloc] initWithString:link];
            [attributedLink addAttribute:NSLinkAttributeName value:link range:NSMakeRange(0, link.length)];
            [self.uploadLinkTextField setAttributedStringValue:attributedLink];
            
            [self.uploadLinkTextField selectText:self];
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK.FileAPI getLinks:@{@"quick_key" : quickkey, @"link_type" : @"normal_download"} callbacks:linkCallbacks];
    });
}

//------------------------------------------------------------------------------
- (void)requestFoldersChunk:(NSUInteger)chunk {
    NSDictionary* contentCallbacks =
    @{ONERROR   : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"[MFSDK OSX Demo] Error getting folder contents. - %@", errorResponse);
        });
    },ONLOAD    : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* folderContent = loadResponse[@"folder_content"];
            NSArray* folders = folderContent[@"folders"];
            
            [self.contentResults addObjectsFromArray:folders];
            
            [self.tableView reloadData];
            
            if ([folders count] == 100) {
                [self requestFoldersChunk:chunk+1];
            } else {
                [self requestFilesChunk:1];
            }
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK.FolderAPI getContent:@{@"folder_key" : @"myfiles",
                                             @"content_type" : @"folders",
                                             @"chunk" : [NSNumber numberWithUnsignedInteger:chunk]}
                                 callbacks:contentCallbacks];
    });
}

//------------------------------------------------------------------------------
- (void)requestFilesChunk:(NSUInteger)chunk {
    NSDictionary* contentCallbacks =
    @{ONERROR   : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"[MFSDK OSX Demo] Error getting folder contents. - %@", errorResponse);
        });
    },ONLOAD    : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* folderContent = loadResponse[@"folder_content"];
            NSArray* files = folderContent[@"files"];
            
            [self.contentResults addObjectsFromArray:files];
            
            [self.tableView reloadData];
            
            if ([files count] == 100) {
                [self requestFilesChunk:chunk+1];
            }
        });
    }};
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [MediaFireSDK.FolderAPI getContent:@{@"folder_key" : @"myfiles",
                                             @"content_type" : @"files",
                                             @"chunk" : [NSNumber numberWithUnsignedInteger:chunk]}
                                 callbacks:contentCallbacks];
    });
}

//============================================================================
// Table View
//============================================================================
//------------------------------------------------------------------------------
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.contentResults count];
}

//------------------------------------------------------------------------------
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSDictionary* content = [self.contentResults objectAtIndex:row];
    
    NSTextField *cell = [tableView makeViewWithIdentifier:@"MFView" owner:self];
    
    if (cell == nil) {
        cell = [[NSTextField alloc] initWithFrame:CGRectZero];
        
        [cell setBezeled:FALSE];
        [cell setEditable:FALSE];
        [cell setDrawsBackground:FALSE];
        [cell setIdentifier:@"MFView"];
    }
    
    if ([tableColumn.identifier isEqualToString:@"name"]) {
        cell.stringValue = content[@"filename"] != nil ? content[@"filename"] : content[@"name"];
    } else if ([tableColumn.identifier isEqualToString:@"type"]) {
        cell.stringValue = content[@"filetype"] != nil ? [content[@"filetype"] capitalizedString] : @"Folder";
    } else if ([tableColumn.identifier isEqualToString:@"key"]) {
         cell.stringValue = content[@"quickkey"] != nil ? content[@"quickkey"] : content[@"folderkey"] ;
    } else if ([tableColumn.identifier isEqualToString:@"date"]) {
        cell.stringValue = content[@"created"];
    } else if ([tableColumn.identifier isEqualToString:@"privacy"]) {
        cell.stringValue = [content[@"privacy"] capitalizedString];
    }

    return cell;
}


//============================================================================
// Upload
//============================================================================
//------------------------------------------------------------------------------
- (IBAction)selectFile:(id)sender {
    NSOpenPanel* openPanel = [NSOpenPanel openPanel];
    
    [openPanel setCanChooseFiles:TRUE];
    [openPanel setCanChooseDirectories:FALSE];
    [openPanel setAllowsMultipleSelection:FALSE];
    [openPanel setPrompt:@"Upload"];
    
    if ([openPanel runModal] == NSOKButton) {
        NSArray* files = [openPanel URLs];
        NSURL* selectFileURL = [files firstObject];
        
        [self uploadFileAtPath:[selectFileURL path]];
    }
}

//------------------------------------------------------------------------------
- (void)uploadFileAtPath:(NSString*)path {
    [self.uploadLinkTextField setHidden:FALSE];
    [self.uploadNameTextField setHidden:FALSE];
    [self.uploadProgressIndicator setHidden:FALSE];
    [self.uploadStatusTextField setHidden:FALSE];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        MFUploadTransaction* upt = [[MFUploadTransaction alloc] initWithFilePath:path];
        [upt startWithCallbacks:[self getUploadCallbacks]];
    });
}

//------------------------------------------------------------------------------
- (NSDictionary*)getUploadCallbacks {
    NSDictionary* uploadCallbacks =
    @{ONERROR : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* response  = errorResponse[@"response"];
            NSDictionary* fileInfo  = errorResponse[@"fileInfo"];
            
            NSLog(@"[MFSDK OSX Demo] Upload failure. - %@", response);
            
            [self.uploadNameTextField setStringValue:[NSString stringWithFormat:@"Uploading %@", fileInfo[UFILENAME]]];
            [self.uploadStatusTextField setStringValue:@"Upload failed!"];
        });
        
    },ONUPDATE : ^(NSDictionary* updateResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* response  = updateResponse[@"response"];
            NSDictionary* fileInfo  = updateResponse[@"fileInfo"];
            NSString* event         = response[UEVENT];
            
            [self updateProgressFromFileInfo:fileInfo];
            
            [self.uploadNameTextField setStringValue:[NSString stringWithFormat:@"Uploading %@", fileInfo[UFILENAME]]];
            
            if ([UESETUP isEqualToString:event]) {
                [self.uploadStatusTextField setStringValue:@"Perparing complete..."];
            } else if ([UECHUNK isEqualToString:event]) {
                [self.uploadStatusTextField setStringValue:@"Uploading..."];
            } else if ([UECHUNKS isEqualToString:event]) {
                [self.uploadStatusTextField setStringValue:@"Upload finished..."];
            } else if ([UEPOLL isEqualToString:event]) {
                [self.uploadStatusTextField setStringValue:@"Verifying..."];
            } else if ([UEHANG isEqualToString:event]) {
                [self.uploadStatusTextField setStringValue:@"Verifying...."];
            }
        });
    },ONLOAD : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* response  = loadResponse[@"response"];
            NSDictionary* fileInfo  = loadResponse[@"fileInfo"];
            NSDictionary* doUpload  = response[@"doupload"];
            
            [self.uploadProgressIndicator setIndeterminate:FALSE];
            [self.uploadProgressIndicator setDoubleValue:1.0];
            
            [self.uploadNameTextField setStringValue:[NSString stringWithFormat:@"Uploaded %@", fileInfo[UFILENAME]]];
            [self.uploadStatusTextField setStringValue:@"Upload successful!"];
            
            if (doUpload[@"quickkey"] != nil) {
                [self requestLinkForQuickkey:doUpload[@"quickkey"]];
            } else if (response[@"duplicate_quickkey"] != nil) {
                [self requestLinkForQuickkey:response[@"duplicate_quickkey"]];
            }
        });
    }};
    
    return uploadCallbacks;
}

//----------------------------------------------------------------------------
- (void)updateProgressFromFileInfo:(NSDictionary*)fileInfo {
    NSUInteger lastUnit = [fileInfo[@"lastunit"] integerValue];
    NSUInteger unitCount  = [fileInfo[@"unitcount"] integerValue];
    
    if (lastUnit == 0 || unitCount == 0) {
        [self.uploadProgressIndicator setIndeterminate:TRUE];
        [self.uploadProgressIndicator startAnimation:self];
    } else {
        [self.uploadProgressIndicator setIndeterminate:FALSE];
        [self.uploadProgressIndicator setDoubleValue:(double)lastUnit/unitCount];
    }
}

@end
