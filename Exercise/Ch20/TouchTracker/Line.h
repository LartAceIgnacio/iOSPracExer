//
//  Line.h
//  TouchTracker
//
//  Created by Ace Ignacio on 2/7/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Line : NSObject {
    CGPoint begin;
    CGPoint end;
}
@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;

@end
