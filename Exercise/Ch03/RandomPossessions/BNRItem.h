//
//  BNRItem.h
//  RandomPossessions
//
//  Created by Ace Ignacio on 1/30/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    //NSString *itemName;
    //NSString *serialNumber;
    //int valueInDollars;
    //NSDate *dateCreated;
    //BNRItem *containedItem;
    //__weak BNRItem *container;
}

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

-(id)initWithName:(NSString *)name
     serialNumber:(NSString *)sNumber
   valueInDollars:(int)value;

-(id)initWithName:(NSString *)name;

-(id)initWithNAme:(NSString *)name
     serialNumbeR:(NSString *)sNumber;

+(id)randomItem;


@end
