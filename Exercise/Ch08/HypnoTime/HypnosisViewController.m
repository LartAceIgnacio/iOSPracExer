//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Ace Ignacio on 2/4/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

-(id)init
{
    self = [super initWithNibName:nil bundle:nil];
    
    if( self ) {
        //Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        //Give it label
        [tbi setTitle:@"Hypnosis"];
        //set image
        UIImage *icon = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:icon];
    }
    
    return  self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

//This method gets called automatically when the view is created
-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded the view for the hypnosis");
    
    //[[self view] setBackgroundColor:[UIColor orangeColor]];
}

-(void)loadView
{
    HypnosisView *hv = [[HypnosisView alloc]initWithFrame:CGRectZero];
    [hv setBackgroundColor:[UIColor clearColor]];
    [self setView:hv];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"Monitor accelerometer");
    UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];
    
    //Receives update every 1/10 of a second.
    [a setUpdateInterval:0.1];
    [a setDelegate:self];
    [[self view] becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    HypnosisView *hv = (HypnosisView *)[self view];
    float xShift = [hv xShift] * 0.8 + [acceleration x] * 2.0;
    float yShift = [hv yShift] * 0.8 - [acceleration y] * 2.0;
    [hv setXShift:xShift];
    [hv setYShift:yShift];
    
    //redraw the view
    [hv setNeedsDisplay];
}

@end
