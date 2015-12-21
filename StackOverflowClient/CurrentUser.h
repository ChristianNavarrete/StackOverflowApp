//
//  CurrentUser.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/12/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

@interface CurrentUser : NSObject

@property int reputation;
@property int userId;
@property (strong, nonatomic) NSString *userType;
@property (strong, nonatomic) NSURL *profileImageURL;
@property (strong, nonatomic) UIImage *profileImage;
@property (strong, nonatomic) NSString *displayName;
@property (strong, nonatomic) NSURL *link;
@property int bronzeBadges;
@property int silverBadges;
@property int goldBadges;


- (id)initWithDisplayName:(NSString *)displayName userId:(int)userId reputation:(int)reputation userType:(NSString *)userType profileImageURL:(NSURL *)profileImageURL link:(NSURL *)link bronzeBadges:(int)bronzeBadges silverBadges:(int)silverBadges goldBadges:(int)goldBadges;

@end
