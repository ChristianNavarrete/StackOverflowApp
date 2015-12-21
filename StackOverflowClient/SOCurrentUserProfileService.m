//
//  SOCurrentUserProfileService.m
//  StackOverflowClient
//
//  Created by HoodsDream on 12/10/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import "SOCurrentUserProfileService.h"
#import "JSONRequestService.h"

@implementation SOCurrentUserProfileService


+(void)grabCurrentUser:(kIdCompletionHandler)completion {
    
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *stringformat = @"https://api.stackexchange.com/2.2/me";
    
    NSString *urlString = stringformat;
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:[userDefaults objectForKey:@"accessToken"] forKey:@"access_token"];
    NSLog(@"The access token is %@", [userDefaults objectForKey:@"accessToken"]);
    [parameters setObject:@"bfbGmJwr)Yg4*W79gGiTjQ((" forKey:@"key"];
    [parameters setObject:@"stackoverflow" forKey:@"site"];
    [parameters setObject:@"reputation" forKey:@"sort"];
    [parameters setObject:@"desc" forKey:@"order"];
   
    
    [JSONRequestService getRequestWithURL:urlString parameters:parameters withCompletion:^(id data, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        if ([data isKindOfClass:[NSDictionary class]]) {
            NSDictionary *results = (NSDictionary *)data;
            completion(results, nil);
            return;
        }
        
        
    }];
    
    
    
    NSLog(@"%@?access_token=%@&key=fbGmJwr)Yg4*W79gGiTjQ((&site=stackoverflow&sort=reputation&order=desc", urlString,[userDefaults objectForKey:@"accessToken"]);
    
    
}


@end
