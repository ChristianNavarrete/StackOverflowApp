//
//  SOCurrentUserQuestionsService.m
//  StackOverflowClient
//
//  Created by HoodsDream on 12/12/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import "SOCurrentUserQuestionsService.h"
#import "Constants.h"
#import "JSONRequestService.h"

@implementation SOCurrentUserQuestionsService

+(void)grabbCurrentUserQuestions:(kNSDictionaryCompletionHandler)completion {
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] init];
    NSString *token = [userDefaults objectForKey:@"accessToken"];
    
    NSString *url = @"https://api.stackexchange.com/2.2/me/questions";
    
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    [parameters setObject:token forKey:@"access_token"];
    [parameters setObject:@"bfbGmJwr)Yg4*W79gGiTjQ((" forKey:@"key"];
    [parameters setObject:@"stackoverflow" forKey:@"site"];
    [parameters setObject:@"activity" forKey:@"sort"];
    [parameters setObject:@"desc" forKey:@"order"];
    [parameters setObject:@"1" forKey:@"page"];
    
    [JSONRequestService getRequestWithURL:url parameters:parameters withCompletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
        } else {
            completion(data, nil);
        }
        
        
    }];
    
    
    
}

@end
