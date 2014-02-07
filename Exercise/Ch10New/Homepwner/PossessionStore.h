//
//  PossessionStore.h
//  Homepwner
//
//  Created by Ace Ignacio on 2/5/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Possession;

@interface PossessionStore : NSObject
{
    NSMutableArray *allPossessions;
}
+(PossessionStore *)defaultStore;

-(NSArray *)allPossessions;
-(Possession *)createPossession;
-(void)removePossession:(Possession *)p;
-(void)movePossessionAtIndex:(int)from toIndex:(int)to;

-(NSString *)possessionArchievePath;
-(BOOL)saveChanges;
-(void)fetchPossessionsIfNecessary;

@end
