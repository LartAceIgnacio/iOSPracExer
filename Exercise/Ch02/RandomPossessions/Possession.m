//
//  Possession.m
//  RandomPossessions
//
//  Created by Ace Ignacio on 1/30/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "Possession.h"

@implementation Possession

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

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if(self) {
        //For each instance variable that is archived, we decode it
        //and pass it to setters. (where it is retained)
        [self setItemName:[aDecoder decodeObjectForKey:@"ItemName"]];
        [self setSerialNumber:[aDecoder decodeObjectForKey:@"SerialNumber"]];
        [self setValueInDollars:[aDecoder decodeIntForKey:@"ValueInDollars"]];
        
        //date created is read only we have no setter. We explicity
        //reatin it and set our instance varaiable pointer to it
        
        dateCreated = [aDecoder decodeObjectForKey:@"dateCreated"];
    }
    return self;
}

+(id)randomPossession
{
    NSArray *randomAdjectivelist = [[NSArray alloc]initWithObjects:@"Fluffy",@"Rusty",@"Shiny",@"Bloody", nil];
    
    NSArray *randomNounList = [[NSArray alloc]initWithObjects:@"Bear",@"Spork",@"Mac",@"Sofa", nil];
    
    NSInteger adjectiveIndex =rand() % [randomAdjectivelist count];
    NSInteger nounIndex = rand() % [ randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",[randomAdjectivelist objectAtIndex:adjectiveIndex],[randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString *serialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",'0' + rand() %10, 'A' + rand() % 26, '0' + rand() % 10, 'A' + rand() % 26,'0' + rand() % 10];
    
    Possession *newItem = [[self alloc]initWithName:randomName serialNumber:serialNumber valueInDollars:randomValue];
    
    return newItem;
    
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //For each instance variable , archive it under its variable name
    //These objects will also be sent encodewithCode:
    [encoder encodeObject:itemName forKey:@"ItemName"];
    [encoder encodeObject:serialNumber forKey:@"SerialNumber"];
    [encoder encodeObject:dateCreated forKey:@"dateCreated"];
    // image key I did not include image key in the applicaiton
    
    //For primitive type values in dollars, make sure to encode int :forkey
    // The valueinDollars will be placed in the coder object
    [encoder encodeInt:valueInDollars forKey:@"ValueInDollars"];
}
@end
