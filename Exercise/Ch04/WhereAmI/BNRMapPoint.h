//
//  BNRMapPoint.h
//  WhereAmI
//
//  Created by Ace Ignacio on 2/3/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface BNRMapPoint : NSObject <MKAnnotation>
{
    
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c
                  title:(NSString *)t;

@property (nonatomic,readonly)CLLocationCoordinate2D coordinate;
@property (nonatomic,copy)NSString *title;

@end
