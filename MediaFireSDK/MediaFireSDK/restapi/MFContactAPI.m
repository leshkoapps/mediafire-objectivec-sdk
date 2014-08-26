//
//  MFContactAPI.m
//  MediaFireSDK
//
//  Created by Mike Jablonski on 3/19/14.
//  Copyright (c) 2014 MediaFire. All rights reserved.
//

#import "MFContactAPI.h"
#import "NSDictionary+MapObject.h"
#import "MFConfig.h"
#import "MFHTTPOptions.h"

@implementation MFContactAPI

//------------------------------------------------------------------------------
- (id)init {
    self = [self initWithVersion:[MFConfig defaultAPIVersionForModule:@"MFContactAPI"]];
    if (self == nil) {
        return nil;
    }
    return self;
}

//------------------------------------------------------------------------------
- (id)initWithVersion:(NSString*)version {
    self = [super initWithPath:@"contact" version:version];
    if (self == nil) {
        return nil;
    }
    return self;
}


//------------------------------------------------------------------------------
- (void)add:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self add:@{} query:parameters callbacks:cb];
}

- (void)add:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self createRequest:[options merge:@{HURL : @"add.php"}] query:parameters callbacks:cb];
}

//------------------------------------------------------------------------------
- (void)delete:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self delete:@{} query:parameters callbacks:cb];
}

- (void)delete:(NSDictionary*)options query:(NSDictionary*)parameters callbacks:(NSDictionary*)cb {
    [self createRequest:[options merge:@{HURL : @"delete.php"}] query:parameters callbacks:cb];
}

@end
