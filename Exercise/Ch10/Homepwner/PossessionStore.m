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
    return self;
}

-(NSArray *)allPossessions
{
    //This ensures allPossessions is created
    [self fetchPossessionsIfNecessary];
    
    return allPossessions;
}

-(Possession *)createPossession
{
    //Ensures allPossessions is created
    [self fetchPossessionsIfNecessary];
    
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

-(NSString *)possessionArchievePath
{
    //the return path will be sandbox/Documents/possessions.data
    //Both the saving and the loading methods will call this method to get the same path
    //preventing a typo in the path name of either method
    
    return pathInDocumentDirectory(@"possession.data");
}

-(BOOL)saveChanges
{
    //returns success or failure
    return [NSKeyedArchiver archiveRootObject:allPossessions toFile:[self possessionArchievePath]];
}

-(void)fetchPossessionsIfNecessary
{
    //If we don't have currently have an all possessions array, try to read one from disk
    if(!allPossessions) {
        NSString *path = [self possessionArchievePath];
        allPossessions = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    //If we tried to read one from disk but does not exist, then create a new one
    if(!allPossessions) {
        allPossessions = [[NSMutableArray alloc]init];
    }
}


@end
