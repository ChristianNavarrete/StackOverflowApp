//
//  SOCurrentUserQuestionsService.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/12/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOCurrentUserQuestionsService : NSObject

+(void)grabbCurrentUserQuestions:(kNSDictionaryCompletionHandler)completion;

@end
