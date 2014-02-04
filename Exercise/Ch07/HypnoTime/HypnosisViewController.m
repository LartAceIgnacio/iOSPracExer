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


@end
