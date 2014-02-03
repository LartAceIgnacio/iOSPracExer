//
//  WhereAmIViewController.m
//  WhereAmI
//
//  Created by Ace Ignacio on 2/3/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "WhereAmIViewController.h"
#import "BNRMapPoint.h"

@interface WhereAmIViewController ()

@end

@implementation WhereAmIViewController

@synthesize worldView,locationDistance,activityIndicator,locationField;

-(void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    BNRMapPoint *mp = [[BNRMapPoint alloc]initWithCoordinate:coord title:[locationField text]];
    
    [worldView addAnnotation:mp];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 500, 500);
    [worldView setRegion:region animated:YES];
    
    //Reset the UI
    [locationField setText:@""];
    [activityIndicator stopAnimating];
    [locationField setHidden:NO];
    [locationManager startUpdatingLocation];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    
    [textField resignFirstResponder];

    return  YES;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc , 500, 500);
    [worldView setRegion:region animated:YES];
    [worldView setMapType:MKMapTypeSatellite];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        //Create location manager object
        locationManager = [[CLLocationManager alloc]init];
        
        //[self doSomethingWeird];
        
        [locationManager setDelegate:self];
        
        //Set accuracy
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        //to set distance filter
        //[locationManager setDistanceFilter:1.0f];
        
        //No need because we have the MKMapView
        [locationManager startUpdatingLocation];
    }
    return  self;
}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@",newLocation);
    
    //How many seconds ago was this new location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    
    if(t < -180) {
        return;
    }
    
    [self foundLocation:newLocation];
}

-(void)locationManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@",error);
}

-(void)dealloc
{
    //Tell the location manager to stop sending messages to us
    [locationManager setDelegate:nil];
}

/*
-(void)doSomethingWeird
{
    NSLog(@"Print 1");
    NSLog(@"Print 2");
    NSLog(@"Print 3");
}
*/







@end