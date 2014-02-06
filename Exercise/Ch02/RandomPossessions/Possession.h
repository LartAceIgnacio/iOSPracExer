//
//  Possession.h
//  RandomPossessions
//
//  Created by Ace Ignacio on 1/30/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject <NSCoding>
{
    NSString *itemName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
}

@property NSString *itemName;
@property NSString *serialNumber;
@property int valueInDollars;
@property NSDate *dateCreated;

-(id)initWithName:(NSString *)name
     serialNumber:(NSString *)sNumber
   valueInDollars:(int)value;

-(id)initWithName:(NSString *)name;

-(id)initWithNAme:(NSString *)name
     serialNumbeR:(NSString *)sNumber;

+(id)randomPossession;

@end
