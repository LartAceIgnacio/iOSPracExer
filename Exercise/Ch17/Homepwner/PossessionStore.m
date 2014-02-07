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
    
    //Read in Homepwner.xcdatamodeld
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    //NSLog(@"mode; = %@",model);
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    
    //Where does the SQLite file go?
    NSString *path = pathInDocumentDirectory(@"store.data");
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    NSLog(@"%@",path);
    NSError *error = nil;
    
    if(![psc addPersistentStoreWithType:NSSQLiteStoreType
                          configuration:nil
                                    URL:storeURL
                                options:nil
                                  error:&error]) {
        [NSException raise:@"Open failed"
                    format:@"Reason: %@",[error localizedDescription]];
    }
    
    //Create the managed object context
    context = [[NSManagedObjectContext alloc]init];
    [context setPersistentStoreCoordinator:psc];
    
    //The managed object context can manage undo, but we don't need it
    [context setUndoManager:nil];

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
    //This ensures allPossessions is created
    [self fetchPossessionsIfNecessary];
    double order;
    if([allPossessions count] == 0) {
        order = 1.0;
    } else {
        order = [[[allPossessions lastObject]orderingValue]doubleValue] + 1.0;
    }
    NSLog(@"Adding after %d items, order %.2f",[allPossessions count],order);
    
    Possession *p = [NSEntityDescription insertNewObjectForEntityForName:@"Possession" inManagedObjectContext:context];
    
    [p setOrderingValue:[NSNumber numberWithDouble:order]];
    
    [allPossessions addObject:p];
    
    return p;
}

-(void)removePossession:(Possession *)p
{
    [context deleteObject:p];
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
    
    //Computing a new orderValue for the object that was moved
    double lowerBound = 0.0;
    
    //Is there an object before it in the array?
    if(to > 0) {
        lowerBound = [[[allPossessions objectAtIndex:to - 1]orderingValue]doubleValue];
    } else {
        lowerBound = [[[allPossessions objectAtIndex:1]orderingValue]doubleValue] - 2.0;
    }
    
    double upperBound = 0.0;
    
    //is ther an object after it in the array?
    if (to < [allPossessions count] - 1) {
        upperBound = [[[allPossessions objectAtIndex:to +1]orderingValue]doubleValue];
    } else {
        upperBound = [[[allPossessions objectAtIndex:to - 1]orderingValue]doubleValue] + 2.0;
    }
    
    //The order value will be the midpoint between the lower and upper bounds
    NSNumber *n = [NSNumber numberWithDouble:(lowerBound + upperBound)/2.0];
    
    NSLog(@"Moving to otder %@",n);
    [p setOrderingValue:n];
}

-(BOOL)saveChanges
{
    NSError *err = nil;
    BOOL successful = [context save:&err];
    if(!successful) {
        NSLog(@"Error saving : %@",[err localizedDescription]);
    }
    return successful;
    //returns success or failure
    //return [NSKeyedArchiver archiveRootObject:allPossessions toFile:[self possessionArchievePath]];
}

-(NSString *)possessionArchievePath
{
    //The returned path will be Sandbox/Documents/possessions.data
    //Both the saving and loading methos will call this method to get the same path,
    //preventing a typo in the path name of either method
    return pathInDocumentDirectory(@"possessions.data");
}

-(void)fetchPossessionsIfNecessary
{
    if(!allPossessions) {
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Possession"];
        [request setEntity:e];
        
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue" ascending:YES];
        [request setSortDescriptors:[NSArray arrayWithObject:sd]];
        
        NSError *error;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if(!result) {
            [NSException raise:@"Fetch failed" format:@"Reason: %@",[error localizedDescription]];
        }
        allPossessions = [[NSMutableArray alloc]initWithArray:result];
        
    }
}

-(NSArray *)allAssetTypes
{
    if(!allAssetTypes) {
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"AssetType"];
        [request setEntity:e];
        
        NSError *error;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if(!result) {
            [NSException raise:@"Fetch failed:" format:@"Reasong: %@",[error localizedDescription]];
        }
        allAssetTypes = [result mutableCopy];
    }
    
    //Is this the first time the program is being run?
    if([allAssetTypes count] == 0) {
        NSManagedObject *type;
        
        type = [NSEntityDescription insertNewObjectForEntityForName:@"AssetType" inManagedObjectContext:context];
        [type setValue:@"Furniture" forKey:@"label"];
        [allAssetTypes addObject:type];
        
        type = [NSEntityDescription insertNewObjectForEntityForName:@"AssetType" inManagedObjectContext:context];
        [type setValue:@"Jewelry" forKey:@"label"];
        [allAssetTypes addObject:type];
        
        type = [NSEntityDescription insertNewObjectForEntityForName:@"AssetType" inManagedObjectContext:context];
        [type setValue:@"Electronics" forKey:@"label"];
        [allAssetTypes addObject:type];
    }
    return  allAssetTypes;
    
}

@end
