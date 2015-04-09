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
#import "LOTInstagramTableViewCell.h"

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

                 
                 
                 
                 if (temp[@"caption"] == (id)[NSNull null]) {
                     NSString *username =@"No Username";
                     NSString *caption = @"No Caption";
                     NSLog(@"AFN says:%@....%@",username, caption);
                     [self.manager addInstagramData:@[username,picURL,caption]];
                     
                 }else{
                     NSString *username = temp[@"caption"][@"from"][@"username"];
                     NSString *caption = temp[@"caption"][@"text"];
                     NSLog(@"AFN says:%@....%@",username, caption);
                     [self.manager addInstagramData:@[username,picURL,caption]];
                 }

                       
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



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}







-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"feedCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *cellUsernameString = [self.manager retrieveInstagramData][indexPath.row][0];
    NSString *cellImageString = [self.manager retrieveInstagramData][indexPath.row][1];
    NSString *cellCaptionString = [self.manager retrieveInstagramData][indexPath.row][2];
    
    cell.textLabel.text = cellUsernameString;
    cell.detailTextLabel.text = cellCaptionString;
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:cellImageString]]];
    
        
    return cell;
    
    

    
    
    
    
    
}







////Storyboard Version
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    static NSString *cellIdentifier = @"photoCell";
//    LOTInstagramTableViewCell *cell = [self.instaResultsTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    
//    
//    NSString *cellUsernameString = [self.manager retrieveInstagramData][indexPath.row][0];
//    NSString *cellImageString = [self.manager retrieveInstagramData][indexPath.row][1];
//    NSString *cellCaptionString = [self.manager retrieveInstagramData][indexPath.row][2];
//    
//    cell.userIDLabel.text = cellUsernameString;
//    cell.photo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:cellImageString]]];
//    cell.captionLabel.text = cellCaptionString;
//    
//    
//    return cell;
//    
//}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
