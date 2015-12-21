//
//  CurrentUser.m
//  StackOverflowClient
//
//  Created by HoodsDream on 12/12/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import "CurrentUser.h"

@implementation CurrentUser

- (id)initWithDisplayName:(NSString *)displayName userId:(int)userId reputation:(int)reputation userType:(NSString *)userType profileImageURL:(NSURL *)profileImageURL link:(NSURL *)link bronzeBadges:(int)bronzeBadges silverBadges:(int)silverBadges goldBadges:(int)goldBadges {
    
    if (self = [super init]) {
        [self setDisplayName:displayName];
        [self setUserId:userId];
        [self setReputation:reputation];
        [self setUserType:userType];
        [self setProfileImageURL:profileImageURL];
        [self setLink:link];
        [self setBronzeBadges:bronzeBadges];
        [self setSilverBadges:silverBadges];
        [self setGoldBadges:goldBadges];
    }
    return self;

    
    
    
}

@end
