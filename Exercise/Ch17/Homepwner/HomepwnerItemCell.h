//
//  HomepwnerItemCell.h
//  Homepwner
//
//  Created by Ace Ignacio on 2/7/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@class Possession;

@interface HomepwnerItemCell : UITableViewCell
{
    UILabel *valueLabel;
    UILabel *nameLabel;
    UILabel *serialLabel;
}

-(void)setPossession:(Possession *)possession;

@end
