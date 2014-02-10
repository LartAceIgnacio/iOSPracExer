//
//  TouchDrawView.m
//  TouchTracker
//
//  Created by Ace Ignacio on 2/7/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "TouchDrawView.h"
#import "Line.h"

@implementation TouchDrawView

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self) {
        
        NSLog(@"%@",_view);
        linesInProcess = [[NSMutableDictionary alloc]init];
        
        //Don't let the autocomplete fool you on the next line,
        //make sure you are instantiating an NSMutableArray
        //and dnot an NSMutableDictionary
        completeLines = [[NSMutableArray alloc]init];
        
        [self setMultipleTouchEnabled:YES];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //Draw complete lines in black
    [[UIColor blackColor]set];
    for(Line *line in completeLines) {
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line end].x, [line end].y);
        CGContextStrokePath(context);
    }
    
    //Draw line in process in red
    [[UIColor redColor] set];
    for(NSValue *v in linesInProcess) {
        Line *line = [linesInProcess objectForKey:v];
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line end].x, [line end].y);
        CGContextStrokePath(context);
    }
}

-(void)clearAll
{
    //Clear the collections
    [linesInProcess removeAllObjects];
    [completeLines removeAllObjects];
    
    //Reddraw
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touches began");
    for(UITouch *t in touches) {
        //Is this a double tap?
        if([t tapCount] > 1) {
            [self clearAll];
            return;
        }
        
        //Use the touch object (packed in an NSValue) as the key
        NSValue *key = [NSValue valueWithPointer:(__bridge const void *)(t)];
        
        //Create a line for the value
        CGPoint loc = [t locationInView:self];
        Line *newLine = [[Line alloc]init];
        [newLine setBegin:loc];
        [newLine setEnd:loc];
        
        //put pair in dictionary
        [linesInProcess setObject:newLine forKey:key];
        
        //
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //update linesinProcess with moved touches
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithPointer:(__bridge const void *)(t)];
        
        //Find the line for this touch
        Line *line = [linesInProcess objectForKey:key];
        
        //Update the line
        CGPoint loc = [t locationInView:self];
        [line setEnd:loc];
    }
    //Redraw
    [self setNeedsDisplay];
}

-(void)endTouches:(NSSet *)touches
{
    //Remove ending touches from dictionary
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithPointer:(__bridge const void *)(t)];
        Line *line = [linesInProcess objectForKey:key];
        
        //If this is a double tap, 'line' will be nil,
        //so make sure not to add it to the array
        if(line) {
            [completeLines addObject:line];
            [linesInProcess removeObjectForKey:key];
        }
    }
    //Redraw
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
}

@end
