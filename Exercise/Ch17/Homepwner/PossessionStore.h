//
//  PossessionStore.h
//  Homepwner
//
//  Created by Ace Ignacio on 2/5/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Possession;

@interface PossessionStore : NSObject
{
    NSMutableArray *allPossessions;
    NSMutableArray *allAssetTypes;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}
+(PossessionStore *)defaultStore;
-(BOOL)saveChanges;
-(NSString *)possessionArchievePath;
-(void)fetchPossessionsIfNecessary;

#pragma mark Possessions
-(NSArray *)allPossessions;
-(Possession *)createPossession;
-(void)removePossession:(Possession *)p;
-(void)movePossessionAtIndex:(int)from toIndex:(int)to;

#pragma mark Asset types
-(NSArray *)allAssetTypes;

@end
