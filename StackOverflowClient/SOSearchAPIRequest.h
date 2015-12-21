//
//  SOSearchAPIRequest.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/8/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOSearchAPIRequest : NSObject

+(void)searchWithTerm:(NSString *)searchTerm pageNumber:(int)pageNumberParam withCompletion:(kNSDictionaryCompletionHandler)completion;

@end
