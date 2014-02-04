//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Ace Ignacio on 2/4/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

-(void)drawRect:(CGRect)rect
{
    CGRect bounds = [self bounds];
    
    //Where is the center
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //From the center how far out to the corner
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    //Get the context being drawn upon
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //All lines will be drawn 10 points wide
    CGContextSetLineWidth(context, 10);
    
    //Set the stroke color to light gray
    [[UIColor lightGrayColor]setStroke];
    
    //Draw circles from the outside in
    for(float currentRadius = maxRadius; currentRadius >0; currentRadius -=20) {
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
}

@end
