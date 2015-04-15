//
//  MapLoadVC.m
//  LOTKitchenSink
//
//  Created by Levan on 4/15/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import "MapLoadVC.h"

@interface MapLoadVC ()

@end

@implementation MapLoadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapLocations = @[
                          @{@"name":@"Envy Labs",
                            @"lat":@28.5407,
                            @"lng":@-81.3786}
                          ];
    
    
    UIButton *mapButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    mapButton.frame = CGRectMake(30, 140, 160, 50);
    [mapButton setTitle:@"Map" forState:UIControlStateNormal];
    mapButton.backgroundColor = [UIColor brownColor];
    [mapButton addTarget:self action:@selector(openInAppleMaps:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mapButton];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)openInAppleMaps:(id)sender{
    double lat = [self.mapLocations[0][@"lat"] doubleValue];
    double lng = [self.mapLocations[0][@"lng"] doubleValue];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lng);
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coord addressDictionary:nil];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.mapLocations[0][@"name"];
    [mapItem openInMapsWithLaunchOptions:nil];
}

@end
