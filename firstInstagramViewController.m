//
//  firstInstagramViewController.m
//  LOTKitchenSink
//
//  Created by Levan Toturgul on 3/27/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import "firstInstagramViewController.h"
#import "LOTDataStore.h"
#import "LOTInstaResultsVC.h"



@interface firstInstagramViewController ()

- (IBAction)myFeedButton:(id)sender;

@end

@implementation firstInstagramViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    
    CGRect bufferSpecs = CGRectMake(60, 150, 200, 100);
    UIView *buttonBuffer = [[UIView alloc]initWithFrame:bufferSpecs];
    buttonBuffer.backgroundColor = [UIColor brownColor];
    [self.view addSubview:buttonBuffer];
    
    
    CGRect buttonSpecs = CGRectMake(5, 5, 180, 90);
    UIButton *myFeedButton = [[UIButton alloc] initWithFrame:buttonSpecs];
    myFeedButton.backgroundColor = [UIColor orangeColor];
    [myFeedButton setTitle:@"My Feed" forState:UIControlStateNormal];
    [buttonBuffer addSubview:myFeedButton];
    
    [myFeedButton addTarget:self action:@selector(launchInstaResults) forControlEvents:UIControlEventTouchUpInside];
    
    
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


    


-(void)launchInstaResults{
    LOTDataStore *manager = [LOTDataStore sharedDataManager];
    if ([[manager retrieveInstaToken]  isEqual: @""]) {
        NSURL *instaAuthURL = [NSURL URLWithString:@"https://instagram.com/oauth/authorize/?client_id=e90b2b96e62c43198d5407544fe97d4a&redirect_uri=instaOAuth://&response_type=token"];
        [[UIApplication sharedApplication] openURL:instaAuthURL];
    }
    else{
        
        LOTInstaResultsVC *nextVC = [[LOTInstaResultsVC alloc]init];
        [[self navigationController] pushViewController:nextVC animated:YES];
        
        
    }
    
}



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
