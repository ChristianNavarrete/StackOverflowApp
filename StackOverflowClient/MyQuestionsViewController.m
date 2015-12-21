//
//  MyQuestionsViewController.m
//  StackOverflowClient
//
//  Created by HoodsDream on 12/7/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import "MyQuestionsViewController.h"
#import "SOCurrentUserQuestionsService.h"
#import "SOCurrentUserQuestionsService.h"
#import "Question.h"
#import "SOSearchJSONParser.h"


@interface MyQuestionsViewController () <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *noQuestionsWarningLabel;

@property (weak, nonatomic) IBOutlet UITableView *myQuestionsTableView;

@property (strong, nonatomic) NSArray *myQuestions;

@end

@implementation MyQuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myQuestionsTableView.dataSource = self;
    self.myQuestionsTableView.delegate = self;
    self.noQuestionsWarningLabel.hidden = YES;

    [self grabQuestions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setMyQuestions:(NSArray *)myQuestions {
    _myQuestions = myQuestions;
    [self.myQuestionsTableView reloadData];
}

- (void)grabQuestions {
    [SOCurrentUserQuestionsService grabbCurrentUserQuestions:^(NSDictionary * _Nullable dictionary, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"You do not have any questions");
            self.noQuestionsWarningLabel.hidden = NO;
            return;
        }
        [SOSearchJSONParser questionsArrayFromDictionary:dictionary completionHandler:^(NSArray * _Nullable data, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error");
                self.noQuestionsWarningLabel.hidden = NO;
                return;
                
            }
            self.noQuestionsWarningLabel.hidden = YES;
            [self setMyQuestions:data];
        }];
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.myQuestions.count == 0){
        
        return 5;
        
    } else {
        return self.myQuestions.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (self.myQuestions.count == 0) {
        cell.textLabel.text = @"You dont have any questions. ):";
    } else {
        
        Question *question = self.myQuestions[indexPath.row];
        
        cell.textLabel.text = question.title;
        
    }
    


    return cell;
}


@end
