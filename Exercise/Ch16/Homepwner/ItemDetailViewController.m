//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by Ace Ignacio on 2/5/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Possession.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

@synthesize possession;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    
    //[nameField release];
    nameField = nil;
    
    //[serialNumberField release];
    serialNumberField = nil;
    
    //[valueField release];
    valueField = nil;
    
    //[dateLabel release];
    dateLabel = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [nameField setText:[possession itemName]];
    [serialNumberField setText:[possession serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d",[possession valueInDollars]]];
    
    
    //Create dateformatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    
    //Use filtered NSDate object to set datelable contents
    [dateLabel setText:[dateFormatter stringFromDate:[possession dateCreated]]];
    
    //Change the navigation item to display name of possession
    [[self navigationItem] setTitle:[possession itemName]];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //Clear first responder
    [[self view]endEditing:YES];
    
    //Save changes to the possession
    [possession setItemName:[nameField text]];
    [possession setSerialNumber:[serialNumberField text]];
    [possession setValueInDollars:[[valueField text] intValue]];
    
}



@end
