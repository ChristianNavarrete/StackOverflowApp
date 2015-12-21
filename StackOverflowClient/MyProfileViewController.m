//
//  MyProfileViewController.m
//  StackOverflowClient
//
//  Created by HoodsDream on 12/12/15.
//  Copyright © 2015 HoodsDream. All rights reserved.
//

#import "MyProfileViewController.h"
#import "SOCurrentUserProfileService.h"
#import "SOCurrentUserJSONParser.h"

@interface MyProfileViewController ()

@property (strong, nonatomic) CurrentUser *currentUser;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *reputationLabel;
@property (weak, nonatomic) IBOutlet UILabel *goldLabel;
@property (weak, nonatomic) IBOutlet UILabel *silverLabel;
@property (weak, nonatomic) IBOutlet UILabel *bronzeLabel;



@end

@implementation MyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self fetchCurrentUser];
    
        
}


-(void) fetchCurrentUser {
    [SOCurrentUserProfileService grabCurrentUser:^(id _Nullable data, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"the error is %@",error.description);
        } else {
            [SOCurrentUserJSONParser parseCurrentUserFromDictionary:data withCompletion:^(CurrentUser * _Nullable user, NSError * _Nullable error) {
                self.currentUser = user;
                [self setupLabels];
            }];
        }
        
    }];
}


-(void) setupLabels {
    ;
    dispatch_queue_t imageQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(imageQueue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:self.currentUser.profileImageURL];
        UIImage *profileImage = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.currentUser.profileImage = profileImage;
            self.imageView.image = profileImage;
        });
    });
    
    self.usernameLabel.text = self.currentUser.displayName;
    self.reputationLabel.text = [NSString stringWithFormat:@"Reputation: %i", self.currentUser.reputation];
    self.goldLabel.text = [NSString stringWithFormat:@"Gold: %i", self.currentUser.goldBadges];
    self.silverLabel.text = [NSString stringWithFormat:@"Silver: %i", self.currentUser.silverBadges];
    self.bronzeLabel.text = [NSString stringWithFormat:@"Bronze: %i", self.currentUser.bronzeBadges];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
