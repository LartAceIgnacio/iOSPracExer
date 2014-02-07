//
//  HomepwnerItemCell.m
//  Homepwner
//
//  Created by Ace Ignacio on 2/7/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "HomepwnerItemCell.h"
#import "Possession.h"

@implementation HomepwnerItemCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        //Create a subview - don't need to specify the position and size.
        valueLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        
        //Put it on the content view of the cell
        [[self contentView] addSubview:valueLabel];
        
        //Same thing with the name
        nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [[self contentView]addSubview:nameLabel];
        
        serialLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [serialLabel setBackgroundColor:[UIColor lightGrayColor]];
        [[self contentView] addSubview:serialLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    //We always call this, the table view cell needs to do its own work first
    [super layoutSubviews];
    
    //we'll use this to add spacing between borders
    float inset = 3.0;
    
    //How much space do we have to work with?
    CGRect bounds = [[self contentView]bounds];
    
    //Let's pull out of the height and width
    //into easie-to-type variable names
    float h = bounds.size.height;
    float w = bounds.size.width;
    
    //this will be a constant value for the valuefield's width
    //float valueWidth = 40.0;
    
    //Create a rectangle on the left hand side of the cell for the imageView
    //CGRect imageFrame = CGRectMake(inset, inset, 40, 40);
    //[imageView setFrame:imageFrame];
    
    //Create rectangle for Serialnumber
    CGRect serialFrame = CGRectMake(inset + 5, inset, w * 0.2, h - inset * 2.0);
    [serialLabel setFrame:serialFrame];
    
    //Create a rectangle in the middle for the name
    CGRect nameFrame = CGRectMake(serialFrame.size.width + serialFrame.origin.x + inset, inset, w * 0.6 + inset, h - inset * 2.0);
    [nameLabel setFrame:nameFrame];
    
    CGRect valueFrame = CGRectMake(nameFrame.size.width + nameFrame.origin.x + inset, inset, w * 0.1, h - inset * 2.0);
    [valueLabel setFrame:valueFrame];
    
}

-(void)setPossession:(Possession *)possession
{
    //Using a possession interface, we can set the values of the subviews
    [valueLabel setText:[NSString stringWithFormat:@"$%@",[possession valueInDollars]]];
    [nameLabel setText:[possession itemName]];
    [serialLabel setText:[possession serialNumber]];
}

@end
