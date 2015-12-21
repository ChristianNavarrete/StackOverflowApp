//
//  Question.h
//  StackOverflowClient
//
//  Created by HoodsDream on 12/8/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Question : NSObject

@property NSString *title;
@property User *owner;
@property int questionID;
@property int viewCount;
@property int score;
@property BOOL isAnswered;

-(id)initWithTitle:(NSString*)title owner:(User*)owner questionID:(int)questionID viewCount:(int)viewCount score:(int)score isAnswered:(BOOL)isAnswered ;

@end
