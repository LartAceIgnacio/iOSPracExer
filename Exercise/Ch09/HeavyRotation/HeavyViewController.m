//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by Ace Ignacio on 2/4/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "HeavyViewController.h"

@interface HeavyViewController ()

@end

@implementation HeavyViewController

-(id)init
{
    self = [super initWithNibName:@"HeavyViewController" bundle:Nil];
    
    return  self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    //Return yes if incoming orientation is portrait
    //or either of the landscapes ,otherwise return NO
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait)
    ||UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

@end
