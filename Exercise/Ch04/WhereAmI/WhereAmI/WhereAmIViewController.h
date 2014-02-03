//
//  WhereAmIViewController.h
//  WhereAmI
//
//  Created by Ace Ignacio on 2/3/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereAmIViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationField;
    
}
@property (assign,nonatomic) CLLocationDistance *locationDistance;
@property MKMapView *worldView;
@property UIActivityIndicatorView *activityIndicator;
@property UITextField *locationField;

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;

//-(void)doSomethingWeird;

@end
