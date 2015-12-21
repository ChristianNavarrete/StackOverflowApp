//
//  OAuthWebViewController.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/7/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OAuthWebViewControllerCompletion)();

@interface OAuthWebViewController : UIViewController

@property (copy, nonatomic) OAuthWebViewControllerCompletion completion;

@end
