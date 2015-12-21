//
//  Error.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/8/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>

//create a constant called kStackOverFlowErrorDomain
extern NSString *const kStackOverFlowErrorDomain;

typedef enum {
    
    StackOverFlowBadJSON,
    StackOverFlowConnectionDown,
    StackOverFlowTooManyAttempts,
    StackOverFlowInvalidParameters,
    StackOverFlowNeedAuthentication,
    StackOverFlowGeneralError

    
} StackOverflowErrorCodes;