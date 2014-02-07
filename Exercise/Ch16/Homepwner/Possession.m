//
//  Possession.m
//  Homepwner
//
//  Created by Ace Ignacio on 2/7/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "Possession.h"


@implementation Possession

@dynamic itemName;
@dynamic serialNumber;
@dynamic valueInDollars;
@dynamic dateCreated;
@dynamic orderingValue;
@dynamic assetType;

-(void)awakeFromFetch
{
    [super awakeFromFetch];
}

-(void)awakeFromInsert
{
    [super awakeFromInsert];
    [self setDateCreated:[NSDate date]];
}

@end
