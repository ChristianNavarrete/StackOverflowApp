//
//  SOCurrentUserJSONParser.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/12/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOCurrentUserJSONParser : NSObject

+(void)parseCurrentUserFromDictionary:(NSDictionary *)dictionary withCompletion:(kCurrentUserCompletionHandler)completion;

@end
