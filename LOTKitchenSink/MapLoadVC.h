//
//  MapLoadVC.h
//  LOTKitchenSink
//
//  Created by Levan on 4/15/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MapKit.h>

@interface MapLoadVC : UIViewController

@property (strong, nonatomic) NSArray *mapLocations;
-(void) openInAppleMaps;//(id)sender;
-(void) openMapViewVC;
@end
