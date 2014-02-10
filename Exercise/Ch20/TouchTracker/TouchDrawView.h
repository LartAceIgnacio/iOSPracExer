//
//  TouchViewDraw.h
//  TouchTracker
//
//  Created by Ace Ignacio on 2/7/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TouchDrawView : UIView
{
    NSMutableDictionary *linesInProcess;
    NSMutableArray *completeLines;
}
@property (strong, nonatomic) IBOutlet UIView *view;

-(void)clearAll;
-(void)endTouches:(NSSet *)touches;

@end
