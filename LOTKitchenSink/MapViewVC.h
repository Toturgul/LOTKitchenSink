//
//  MapViewVC.h
//  LOTKitchenSink
//
//  Created by Levan on 4/16/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
//#import <CoreLocation/CoreLocation.h>
@interface MapViewVC : UIViewController <MKMapViewDelegate>
@property (strong, nonatomic) MKMapView *mapView;

//Check if userLocation has been updated, used to make didUpdateUserLocation method run only once.
//This is needed to PROPERLY open up the map with the user's location as the center
@property BOOL userLocationUpdated;

@end
