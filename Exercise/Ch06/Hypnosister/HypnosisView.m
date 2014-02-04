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
    //[[UIColor lightGrayColor]setStroke];
    
    //Draw circles from the outside in
    for(float currentRadius = maxRadius; currentRadius >0; currentRadius -=20) {
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        [[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1]setStroke];
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
    
    NSString *text = @"You are getting sleepy";
    
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor]setFill];
    
    CGSize offset = CGSizeMake(3, 4);
    CGColorRef color = [[UIColor lightGrayColor]CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    
    //[text drawInRect:<#(CGRect)#> withFont:<#(UIFont *)#>
    [text drawInRect:textRect withFont:font];

}

@end
