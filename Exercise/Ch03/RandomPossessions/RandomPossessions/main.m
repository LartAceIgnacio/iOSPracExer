//
//  main.m
//  RandomPossessions
//
//  Created by Ace Ignacio on 1/30/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc]init];
        
        for(int i = 0; i < 10; i++) {
            BNRItem *p = [BNRItem randomItem];
            [items addObject:p];
        }
        
        for(BNRItem *a in items) {
            NSLog(@"%@",a);
        }
        
        //BRONZE CHALLENGE
        //Terminating app due to uncaught exception 'NSRangeException', reason: '*** -[__NSArrayM objectAtIndex:]: index 11 beyond bounds [0 .. 9]'
        //NSLog(@"%@",[items objectAtIndex:11]);
        
        items = nil;
    }
    return 0;
}

