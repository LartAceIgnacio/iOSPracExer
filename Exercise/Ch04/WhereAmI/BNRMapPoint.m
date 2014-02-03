//
//  BNRMapPoint.m
//  WhereAmI
//
//  Created by Ace Ignacio on 2/3/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint

@synthesize coordinate,title;


-(id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"HomeTown"];
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if(self) {
        coordinate = c;
        [self setTitle:t];
    }
    return  self;
}

@end
