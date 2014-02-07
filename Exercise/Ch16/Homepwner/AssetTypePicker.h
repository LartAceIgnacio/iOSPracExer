//
//  AssetTypePicker.h
//  Homepwner
//
//  Created by Ace Ignacio on 2/7/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Possession;

@interface AssetTypePicker : UITableViewController
{
    Possession *possession;
}

@property (nonatomic, retain) Possession *possession;

@end
