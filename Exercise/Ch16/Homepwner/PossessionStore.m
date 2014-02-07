//
//  PossessionStore.m
//  Homepwner
//
//  Created by Ace Ignacio on 2/5/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "PossessionStore.h"
#import "Possession.h"

static PossessionStore *defualtStore =  Nil;

@implementation PossessionStore

+(PossessionStore *)defaultStore
{
    if(!defualtStore) {
        //Create the singleton
        defualtStore = [[super allocWithZone:NULL]init];
    }
    return defualtStore;
}

//Prevent creation of additional resources
+(id)allocWithZone:(struct _NSZone *)zone
{
    return [self defaultStore];
}

-(id)init
{
    //If we have already have an instance of Possessionstore
    if(defualtStore) {
        //Return the old one
        return defualtStore;
    }
    self = [super init];
    
    if(self) {
        allPossessions = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSArray *)allPossessions
{
    return allPossessions;
}

-(Possession *)createPossession
{
    Possession *p = [Possession randomPossession];
    
    [allPossessions addObject:p];
    
    return p;
}

-(void)removePossession:(Possession *)p
{
    [allPossessions removeObject:p];
}

-(void)movePossessionAtIndex:(int)from toIndex:(int)to
{
    if(from == to) {
        return;
    }
    //Get the pointer of the object being move
    Possession *p = [allPossessions objectAtIndex:from];
    
    //[p retain];
    
    //Remove p from array, it is automatically sent release(retain count p = 1)
    [allPossessions removeObjectAtIndex:from];
    
    //Insert P in array
    [allPossessions insertObject:p atIndex:to];
}


@end
