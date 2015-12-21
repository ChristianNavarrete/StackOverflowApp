//
//  SOCurrentUserJSONParser.m
//  StackOverflowClient
//
//  Created by HoodsDream on 12/12/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import "SOCurrentUserJSONParser.h"
#import "Constants.h"

@implementation SOCurrentUserJSONParser


+(void)parseCurrentUserFromDictionary:(NSDictionary *)dictionary withCompletion:(kCurrentUserCompletionHandler)completion {
    
    if ([dictionary objectForKey:@"items"]) {
        NSDictionary *userObject = [[dictionary objectForKey:@"items"] firstObject];
        if ([userObject objectForKey:@"badge_counts"]) {
            
            NSDictionary*badges = [userObject objectForKey:@"badge_counts"];
            id gold = [badges objectForKey:@"gold"];
            id silver = [badges objectForKey:@"silver"];
            id bronze = [badges objectForKey:@"bronze"];
            
            id reputation = [userObject objectForKey:@"reputation"];
            id userId = [userObject objectForKey:@"user_id"];
            NSString *userType = [userObject objectForKey:@"user_type"];
            NSURL *imageUrl = [NSURL URLWithString:[userObject objectForKey:@"profile_image"]];
            NSString *displayName = [userObject objectForKey:@"display_name"];
            NSURL *link = [NSURL URLWithString:[userObject objectForKey:@"link"]];
            
            
            CurrentUser *user = [[CurrentUser alloc] initWithDisplayName:displayName userId:userId reputation:reputation userType:userType profileImageURL:imageUrl link:link bronzeBadges:bronze silverBadges:silver goldBadges:gold];
            
            if (user) {
                completion(user, nil);
                return;
            }
            
        }
        

    
    NSError *error = [NSError errorWithDomain:@"error" code:1 userInfo:nil];
    completion(nil, error);
    
        
    }

    
}



@end


