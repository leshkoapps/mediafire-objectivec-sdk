//
//  MFFileAPI.m
//  MediaFireSDK
//
//  Created by Daniel Dean on 2/25/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFFileAPI.h"
#import "MFConfig.h"
#import "NSDictionary+MapObject.h"
#import "MFHTTPOptions.h"

@implementation MFFileAPI

//------------------------------------------------------------------------------
- (id)init {
    self = [self initWithVersion:[MFConfig defaultAPIVersionForModule:@"MFFileAPI"]];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (id)initWithVersion:(NSString*)version {
    self = [super initWithPath:@"file" version:version];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (void)configureOneTimeDownload:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self configureOneTimeDownload:@{} query:parameters callbacks:callbacks];
}

- (void)configureOneTimeDownload:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self configureOneTimeDownloadConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)copy:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self copy:@{} query:parameters callbacks:callbacks];
}

- (void)copy:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self copyConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)create:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self create:@{} query:parameters callbacks:callbacks];
}

- (void)create:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self createConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)delete:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self delete:@{} query:parameters callbacks:callbacks];
}

- (void)delete:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self deleteConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getInfo:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getInfo:@{} query:parameters callbacks:callbacks];
}

- (void)getInfo:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getInfoConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getLinks:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getLinks:@{} query:parameters callbacks:callbacks];
}

- (void)getLinks:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getLinksConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getStatus:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getStatus:@{} query:parameters callbacks:callbacks];
}

- (void)getStatus:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getStatusConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)getVersions:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self getVersions:@{} query:parameters callbacks:callbacks];
}

- (void)getVersions:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self getVersionsConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)move:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self move:@{} query:parameters callbacks:callbacks];
}

- (void)move:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self moveConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)oneTimeDownload:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self oneTimeDownload:@{} query:parameters callbacks:callbacks];
}

- (void)oneTimeDownload:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self oneTimeDownloadConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)purge:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self purge:@{} query:parameters callbacks:callbacks];
}

- (void)purge:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self purgeConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)recentlyModified:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self recentlyModified:@{} query:parameters callbacks:callbacks];
}

- (void)recentlyModified:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self recentlyModifiedConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)restore:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self restore:@{} query:parameters callbacks:callbacks];
}

- (void)restore:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self restoreConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)update:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self update:@{} query:parameters callbacks:callbacks];
}

- (void)update:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self updateConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)updateFile:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self updateFile:@{} query:parameters callbacks:callbacks];
}

- (void)updateFile:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self updateFileConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (void)zip:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self zip:@{} query:parameters callbacks:callbacks];
}

- (void)zip:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)callbacks {
    [self createRequest:[self zipConf:options query:parameters] callbacks:callbacks];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)configureOneTimeDownloadConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"configure_one_time_download.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)copyConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"copy.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)createConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"create.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)deleteConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"delete.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getInfoConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"get_info.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getLinksConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"get_links.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getStatusConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"get_status.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)getVersionsConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"get_versions.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)moveConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"move.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)oneTimeDownloadConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"one_time_download.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)purgeConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"purge.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)recentlyModifiedConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"recently_modified.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)restoreConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"restore.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)updateConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"update.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)updateFileConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"update_file.php"}]
                                   query:parameters];
}

//------------------------------------------------------------------------------
- (MFAPIURLRequestConfig*)zipConf:(NSDictionary*)options query:(NSDictionary*)parameters {
    return [self createConfigWithOptions:[options merge:@{HURL: @"zip.php"}]
                                   query:parameters];
}

@end
