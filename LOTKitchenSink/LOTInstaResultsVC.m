//
//  LOTInstaResultsVC.m
//  LOTKitchenSink
//
//  Created by Levan Toturgul on 3/29/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import "LOTInstaResultsVC.h"
#import "LOTDataStore.h"
#import <AFNetworking.h>

@interface LOTInstaResultsVC ()
@property (weak, nonatomic) IBOutlet UITableView *instaResultsTableView;
@property (weak, nonatomic) LOTDataStore *manager;

@end

@implementation LOTInstaResultsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.instaResultsTableView.delegate = self;
    self.instaResultsTableView.dataSource = self;
    self.manager = [LOTDataStore sharedDataManager];


    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSString *userFeedURL = @"https://api.instagram.com/v1/users/self/feed";
    NSDictionary *userFeedParams = @{@"access_token":[self.manager retrieveInstaToken]};
    
    [session GET:userFeedURL
      parameters:userFeedParams
         success:^(NSURLSessionDataTask *task, id responseObject) {
             NSDictionary *results = responseObject;
             for (NSDictionary *temp in results[@"data"]) {
                 NSString *picURL = temp[@"images"][@"standard_resolution"][@"url"];
                 [self.manager addInstagramData:picURL];
                 NSLog(@"AFN says:%@",picURL);
             }
             NSLog(@"retrievedata count:%lu",(unsigned long)[[self.manager retrieveInstagramData]count]);

             [self.instaResultsTableView reloadData];
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Failure: %@",error.localizedDescription);
         }];



}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.manager retrieveInstagramData] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellIdentifier = @"userFeedCell";
    UITableViewCell *cell = [self.instaResultsTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    NSString *cellFiller = [self.manager retrieveInstagramData][indexPath.row];
    NSLog(@"%@",cellFiller);
    cell.textLabel.text = cellFiller;
    return cell;
    
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
