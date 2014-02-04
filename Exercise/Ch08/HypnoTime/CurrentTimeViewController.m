//
//  CurrentTimeViewController.m
//  HypnoTime
//
//  Created by Ace Ignacio on 2/4/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "CurrentTimeViewController.h"

@implementation CurrentTimeViewController

-(id)init
{
    self = [super initWithNibName:@"CurrentTimeViewController" bundle:nil];
    
    if(self) {
        //Get the tab bar item
        UITabBarItem *tbr = [self tabBarItem];
        
        //Put label
        [tbr setTitle:@"Time"];
        
        //Setimage
        UIImage *icon = [UIImage imageNamed:@"Time.png"];
        [tbr setImage:icon];
    }
    
    //[[self view]setBackgroundColor:[UIColor yellowColor]];
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Loaded the time view");
    [[self view]setBackgroundColor:[UIColor greenColor]];
}

-(IBAction)showCurrentTime:(id)sender
{
    NSDate *date = [NSDate date];
    
    static NSDateFormatter *formatter = nil;
    
    if(!formatter) {
        formatter = [[NSDateFormatter alloc]init];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
    }
    
    [lblTime setText:[formatter stringFromDate:date]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    lblTime = nil;
}

-(void)dealloc
{
    //super dealloc];
    //[lblTime release];
}

@end
