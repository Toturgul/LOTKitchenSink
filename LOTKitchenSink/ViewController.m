//
//  ViewController.m
//  LOTKitchenSink
//
//  Created by Levan Toturgul on 3/26/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import "ViewController.h"
#import "firstInstagramViewController.h"
#import "MapLoadVC.h"
@interface ViewController ()
-(void)createOrDismissView;
-(void)makeViewController;
-(void)launchInstagramVC;
@property (nonatomic)int counter;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Services"];
    self.counter = 1;

    
    
    UIButton *instagramButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [instagramButton setTitle:@"Instagram" forState:UIControlStateNormal];
    instagramButton.frame = CGRectMake(0, 200, 200, 60);
    instagramButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:instagramButton];
    [instagramButton addTarget:self action:@selector(launchInstagramVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *mapLoadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [mapLoadButton setTitle:@"MapLoad" forState:UIControlStateNormal];
    [mapLoadButton setFrame:CGRectMake(30, 270, 150, 50)];
    [mapLoadButton setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:mapLoadButton];
    [mapLoadButton addTarget:self action:@selector(launchMapLoadVC) forControlEvents:UIControlEventTouchUpInside];

                                
                                 
}


-(void)createOrDismissView{
    
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, 200, 100)];
    
    
    if (self.counter%2) {
        myView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:myView];
    } else{
        myView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:myView];
    }
    self.counter++;
    
}


-(void)makeViewController{
    UIViewController *newVC = [[UIViewController alloc]init];
    newVC.view.backgroundColor = [UIColor purpleColor];
    [self presentViewController:newVC animated:YES completion:nil];
    
    
}

-(void)launchInstagramVC{
    
    firstInstagramViewController *nextVC = [[firstInstagramViewController alloc]init];
    [[self navigationController]pushViewController:nextVC animated:YES];
    
//    //If using storyboard
//    UIViewController *launchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"firstInstagram"];
//    [self presentViewController:launchVC animated:YES completion:^{}];
    
    
}

-(void)launchMapLoadVC{
    MapLoadVC *vc = [[MapLoadVC alloc]init];
    [[self navigationController]pushViewController:vc animated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
