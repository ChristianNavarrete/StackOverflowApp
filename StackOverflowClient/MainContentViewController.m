//
//  MainContentViewController.m
//  StackOverflowClient
//
//  Created by HoodsDream on 12/7/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import "MainContentViewController.h"

//
#import "SOSearchAPIRequest.h"
#import "SOSearchJSONParser.h"
#import "Question.h"

@interface MainContentViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *questionsArray;

@property (strong, nonatomic) NSCache *imageCache;

@end

@implementation MainContentViewController

-(void)setQuestionsArray:(NSArray *)questionsArray {
    _questionsArray = questionsArray;
    [self.tableView reloadData];
}

- (void)awakeFromNib {
    if (!self.imageCache) {
        self.imageCache = [[NSCache alloc]init];
        [self.imageCache setName:@"UserImageCache"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    
    
    [SOSearchAPIRequest searchWithTerm:@"ios" pageNumber:1 withCompletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"ARG: %@", error.description);
            
        } else {
            [SOSearchJSONParser questionsArrayFromDictionary:data completionHandler:^(NSArray * _Nullable data, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"gosh darnd: %@", error.description);
                }
                
                if (data.count > 0){
                    
                    self.questionsArray = data;
                    
                    Question *questionOne = (Question *) data.firstObject;
                    NSLog(@"Question title one: %@", questionOne.title);
                }
            }];
                 }
        
    }];
    
    
}

#pragma mark SearchBarDelegate Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [SOSearchAPIRequest searchWithTerm:searchBar.text pageNumber:1 withCompletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"ARG: %@", error.description);
            
        } else {
            [SOSearchJSONParser questionsArrayFromDictionary:data completionHandler:^(NSArray * _Nullable data, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"gosh darnd: %@", error.description);
                }
                
                if (data.count > 0){
                    
                    self.questionsArray = data;
                    
                    Question *questionOne = (Question *) data.firstObject;
                    NSLog(@"Question title one: %@", questionOne.title);
                    
                    //search bar stuff
                    [self.searchBar resignFirstResponder];
                    self.searchBar.text = @"";
                }
            }];
        }
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.questionsArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Question *question = [self.questionsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = question.title;
    
    UIImage *image = [self.imageCache objectForKey:question.owner.profileImageURL];
    
    if (image) {
        
        [cell.imageView setImage:image];
        
    } else {
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        
        dispatch_async(queue, ^{
            
            NSData *data = [NSData dataWithContentsOfURL:question.owner.profileImageURL];
            
            UIImage *image = [UIImage imageWithData:data];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                //Saving image to imageCache is this an example of KVO?
                [self.imageCache setObject:image forKey:question.owner.profileImageURL];
                
                //Adding image to imageView
                [cell.imageView setImage:image];
                
                [cell prepareForReuse];
                
            });
            
        });
        
    }
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
