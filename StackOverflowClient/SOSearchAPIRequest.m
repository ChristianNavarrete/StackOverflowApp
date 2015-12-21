//
//  SOSearchAPIRequest.m
//  StackOverflowClient
//
//  Created by HoodsDream on 12/8/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import "SOSearchAPIRequest.h"
#import "JSONRequestService.h"

@implementation SOSearchAPIRequest

+(void)searchWithTerm:(NSString *)searchTerm pageNumber:(int)pageNumberParam withCompletion:(kNSDictionaryCompletionHandler)completion {
    
    NSString *searchAPIURL = @"https://api.stackexchange.com/2.2/search";
    
    NSString *pageNumber;
    
    if (pageNumberParam > 0) {
        pageNumber = [NSString stringWithFormat:@"%d",pageNumberParam];
    } else {
        pageNumber = @"1";
    }
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:pageNumber forKey:@"page"];
    [parameters setObject:@"activity" forKey:@"sort"];
    [parameters setObject:@"desc" forKey:@"order"];
    [parameters setObject:searchTerm forKey:@"intitle"];
    [parameters setObject:@"stackoverflow" forKey:@"site"];
    
    [JSONRequestService getRequestWithURL:searchAPIURL parameters:parameters withCompletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        
        if (error != nil){
            completion(nil, error); return;
        }
        
        completion(data, nil);
    }];
    
}

@end
