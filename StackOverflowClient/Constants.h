//
//  Constants.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/8/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CurrentUser.h"


typedef void (^kNSDataCompletionHandler)(NSDictionary * _Nullable data, NSError * _Nullable error);

typedef void (^kNSDictionaryCompletionHandler)(NSDictionary * _Nullable dictionary, NSError * _Nullable error);

typedef void (^kNSArrayCompletionHandler)(NSArray * _Nullable data, NSError * _Nullable error);

typedef void(^kIdCompletionHandler)(id _Nullable responseObject, NSError *_Nullable error);

typedef void (^kCurrentUserCompletionHandler)(CurrentUser * _Nullable user, NSError * _Nullable error);