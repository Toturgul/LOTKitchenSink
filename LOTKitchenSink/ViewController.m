//
//  ViewController.m
//  LOTKitchenSink
//
//  Created by Levan Toturgul on 3/26/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import "ViewController.h"
#import "firstInstagramViewController.h"
@interface ViewController ()
-(void)createOrDismissView;
-(void)makeViewController;
-(void)launchInstagramVC;
@property (nonatomic)int counter;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.counter = 1;

    
    
    UIButton *instagramButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [instagramButton setTitle:@"Instagram" forState:UIControlStateNormal];
    instagramButton.frame = CGRectMake(0, 300, 200, 60);
    instagramButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:instagramButton];
    [instagramButton addTarget:self action:@selector(launchInstagramVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.navigationItem setTitle:@"Services"];
//    UIBarButtonItem *uselessButton = [[UIBarButtonItem alloc]initWithTitle:@" style:<#(UIBarButtonItemStyle)#> target:<#(id)#> action:<#(SEL)#>]
    
    
    
    
    
    
//    LOTTestXibViewController *vc = [[LOTTestXibViewController alloc]initWithNibName:@"LOTTestXib" bundle:nil];
//    [self presentViewController:vc animated:YES
//                    completion:nil];
    
                                
                                 
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







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
