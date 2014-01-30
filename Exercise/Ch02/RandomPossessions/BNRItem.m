//
//  BNRItem.m
//  RandomPossessions
//
//  Created by Ace Ignacio on 1/30/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

@synthesize itemName,serialNumber,valueInDollars,
dateCreated;

-(NSString *)description
{
    NSString *str = [[NSString alloc]initWithFormat:@"%@ (%@):Worth $%d, recorded on %@",itemName,serialNumber,valueInDollars,dateCreated];
    return str;
}

-(id)init
{
    return [self initWithName:@"Item" serialNumber:@"" valueInDollars:0];
}

-(id)initWithName:(NSString *)name serialNumber:(NSString *)sNumber valueInDollars:(int)value
{
    //calls the super class designated initializer
    self = [super init];
    if(self){
        self.itemName = name;
        self.serialNumber = sNumber;
        self.valueInDollars = value;
    }
    return  self;
}

-(id)initWithName:(NSString *)name
{
    return [self initWithName:name serialNumber:@"" valueInDollars:0];
}

-(id)initWithNAme:(NSString *)name serialNumbeR:(NSString *)sNumber
{
    return [self initWithName:name serialNumber:sNumber valueInDollars:0];
}

+(id)randomItem
{
    NSArray *randomAdjectivelist = [[NSArray alloc]initWithObjects:@"Fluffy",@"Rusty",@"Shiny",@"Bloody", nil];
    
    NSArray *randomNounList = [[NSArray alloc]initWithObjects:@"Bear",@"Spork",@"Mac",@"Sofa", nil];
    
    NSInteger adjectiveIndex =rand() % [randomAdjectivelist count];
    NSInteger nounIndex = rand() % [ randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",[randomAdjectivelist objectAtIndex:adjectiveIndex],[randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString *serialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",'0' + rand() %10, 'A' + rand() % 26, '0' + rand() % 10, 'A' + rand() % 26,'0' + rand() % 10];
    
    BNRItem *newItem = [[self alloc]initWithName:randomName serialNumber:serialNumber valueInDollars:randomValue];
    
    return newItem;
    
}

@end
