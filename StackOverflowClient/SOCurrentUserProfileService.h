//
//  SOCurrentUserProfileService.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/10/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOCurrentUserProfileService : NSObject

+(void)grabCurrentUser:(kIdCompletionHandler)completion;

@end
