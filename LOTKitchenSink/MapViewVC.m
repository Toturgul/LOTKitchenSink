//
//  MapViewVC.m
//  LOTKitchenSink
//
//  Created by Levan on 4/16/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import "MapViewVC.h"

@interface MapViewVC ()
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation MapViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //Adds a map to the viewcontroller that will take up the whole screen
    self.mapView = [[MKMapView alloc]init];
    self.mapView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    
//    //Sets the location and size of the map
//    CLLocationCoordinate2D startCenter = CLLocationCoordinate2DMake(40.8, -74);
//    CLLocationDistance regionWidth = 1500;
//    CLLocationDistance regionLength = 1500;
//    MKCoordinateRegion startRegion = MKCoordinateRegionMakeWithDistance(startCenter, regionWidth, regionLength);
//    [self.mapView setRegion:startRegion animated:YES];

    
    //Asks user for permission to use GPS
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    
    //Gets and shows user's location
    [self.locationManager startUpdatingLocation];
    self.mapView.showsUserLocation = YES;
    
    self.mapView.mapType = MKMapTypeSatellite;
    
    
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    //If statment makes sure the method only runs once.
    //The code will set the user's location as the center of the map and set how much it is zoomed in
    if (!self.userLocationUpdated) {
        CLLocationCoordinate2D startCenter = userLocation.location.coordinate;
        CLLocationDistance regionWidth = 2500;
        CLLocationDistance regionLength = 2500;
        MKCoordinateRegion startRegion = MKCoordinateRegionMakeWithDistance(startCenter, regionWidth, regionLength);
        [self.mapView setRegion:startRegion animated:YES];
        self.userLocationUpdated = YES;
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
