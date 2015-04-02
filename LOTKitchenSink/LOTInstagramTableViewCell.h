//
//  LOTInstagramTableViewCell.h
//  LOTKitchenSink
//
//  Created by Levan Toturgul on 3/31/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LOTInstagramTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;



@end
