//
//  JSONRequestService.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/8/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface JSONRequestService : NSObject

+(void) getRequestWithURL:(NSString* _Nonnull)url parameters:(NSDictionary* _Nullable)parameters withCompletion:(kNSDataCompletionHandler)completion;


@end
