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
        
        //NSMutableArray *items = [[NSMutableArray alloc]init];
        /*
        for(int i = 0; i < 10; i++) {
            BNRItem *p = [BNRItem randomItem];
            //[items addObject:p];
        }
        
        for(BNRItem *a in items) {
            NSLog(@"%@",a);
        }
        */
        
        BNRItem *backpack = [[BNRItem alloc]init];
        [backpack setItemName:@"Backpack"];
        //[items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc]init];
        [calculator setItemName:@"Calculator"];
        //[items addObject:calculator];
        
        [backpack setContainedItem:calculator];
        
        //NSLog(@"Setting items to nil...");
        //items = nil;.
        
        backpack = nil;
        
        NSLog(@"Container: %@",[calculator container]);
        
        calculator = nil;
        
    }
    return 0;
}

