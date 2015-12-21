//
//  SOSearchJSONParser.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/8/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOSearchJSONParser : NSObject

+(void)questionsArrayFromDictionary:(NSDictionary *)data completionHandler:(kNSArrayCompletionHandler)completion;

@end
