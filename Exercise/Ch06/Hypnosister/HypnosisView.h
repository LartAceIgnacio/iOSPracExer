//
//  HypnosisView.h
//  Hypnosister
//
//  Created by Ace Ignacio on 2/4/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HypnosisView : UIView
{
    float xShift, yShift;
    UIColor *stripeColor;
}

@property (nonatomic, assign)float xShift;
@property (nonatomic, assign)float yShift;

@end
