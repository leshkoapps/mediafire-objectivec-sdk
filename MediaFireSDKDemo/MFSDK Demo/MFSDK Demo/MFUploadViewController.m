//
//  MFUploadViewController.m
//  MFSDK Demo
//
//  Created by Mike Jablonski on 7/21/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFUploadViewController.h"
#import "MediaFireSDK/MediaFireSDK.h"
#import "MediaFireSDK/MFUploadTransaction.h"
#import "MediaFireSDK/NSDictionary+Callbacks.h"
#import "MediaFireSDK/MFUploaderConstants.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface MFUploadViewController ()

@end


@implementation MFUploadViewController

//------------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
}

//------------------------------------------------------------------------------
- (IBAction)takeAndUploadPhoto:(id)sender {
    UIImagePickerController* cameraPicker = [[UIImagePickerController alloc] init];
    [cameraPicker setDelegate:self];
    [cameraPicker setMediaTypes: @[(NSString*)kUTTypeImage]];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [cameraPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [cameraPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [self presentViewController:cameraPicker animated:YES completion:nil];
}

//------------------------------------------------------------------------------
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MMM-dd-YYYY-hh.mma"];
        NSString* imageName = [[dateFormat stringFromDate:[NSDate date]] stringByAppendingPathExtension:@"JPEG"];
        
        NSString* temporaryWritePath = [NSTemporaryDirectory() stringByAppendingPathComponent:imageName];
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:temporaryWritePath atomically:YES];
        
        [self startUploadingFileAtPath:temporaryWritePath];
    });
}

//------------------------------------------------------------------------------
- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//------------------------------------------------------------------------------
- (void)startUploadingFileAtPath:(NSString*)path {
    MFUploadTransaction* upt = [[MFUploadTransaction alloc] initWithFilePath:path];
    [upt startWithCallbacks:[self getUploadCallbacks]];
}

//------------------------------------------------------------------------------
- (NSDictionary*)getUploadCallbacks {
    NSDictionary* uploadCallbacks =
    @{ONERROR : ^(NSDictionary* errorResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* response  = errorResponse[@"response"];
            NSDictionary* fileInfo  = errorResponse[@"fileInfo"];
            
            NSLog(@"[MFSDK Demo] Upload failure. - %@", response);
            
            [self.fileNameLabel setText:[NSString stringWithFormat:@"Uploading %@", fileInfo[UFILENAME]]];
            [self.statusLabel setText:@"Upload failed!"];
        });
        
    },ONUPDATE : ^(NSDictionary* updateResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* response  = updateResponse[@"response"];
            NSDictionary* fileInfo  = updateResponse[@"fileInfo"];
            NSString* event         = response[UEVENT];
            
            [self.fileNameLabel setText:[NSString stringWithFormat:@"Uploading %@", fileInfo[UFILENAME]]];
            
            if ([UESETUP isEqualToString:event]) {
                [self.statusLabel setText:@"Perparing complete..."];
            } else if ([UECHUNK isEqualToString:event]) {
                [self.statusLabel setText:@"Uploading..."];
            } else if ([UECHUNKS isEqualToString:event]) {
                [self.statusLabel setText:@"Upload finished..."];
            } else if ([UEPOLL isEqualToString:event]) {
                [self.statusLabel setText:@"Verifying..."];
            } else if ([UEHANG isEqualToString:event]) {
                [self.statusLabel setText:@"Verifying...."];
            }
        });
    },ONLOAD : ^(NSDictionary* loadResponse) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary* fileInfo  = loadResponse[@"fileInfo"];
            
            [self.fileNameLabel setText:[NSString stringWithFormat:@"Uploading %@", fileInfo[UFILENAME]]];
            [self.statusLabel setText:@"Upload successful!"];
        });
    }};

    return uploadCallbacks;
}

@end
