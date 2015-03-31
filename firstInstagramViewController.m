//
//  firstInstagramViewController.m
//  LOTKitchenSink
//
//  Created by Levan Toturgul on 3/27/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import "firstInstagramViewController.h"
#import "LOTDataStore.h"



@interface firstInstagramViewController ()

- (IBAction)myFeedButton:(id)sender;

@end

@implementation firstInstagramViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    

    
    
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


    
    
    


- (IBAction)myFeedButton:(id)sender {
    
    LOTDataStore *manager = [LOTDataStore sharedDataManager];
        if ([[manager retrieveInstaToken]  isEqual: @""]) {
                NSURL *instaAuthURL = [NSURL URLWithString:@"https://instagram.com/oauth/authorize/?client_id=e90b2b96e62c43198d5407544fe97d4a&redirect_uri=instaOAuth://&response_type=token"];
                [[UIApplication sharedApplication] openURL:instaAuthURL];
        }
        else{
    
    UIStoryboard *myStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *resultsVC = [myStoryboard instantiateViewControllerWithIdentifier:@"resultsVC"];
    [self presentViewController:resultsVC animated:YES completion:nil];
    
        }
    
    
    
}




@end
