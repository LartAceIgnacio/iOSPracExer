//
//  ItemDetailViewController.h
//  Homepwner
//
//  Created by Ace Ignacio on 2/5/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Possession;

@interface ItemDetailViewController : UIViewController
{
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *nameField;
    
    Possession *possession;
}

@property (nonatomic, retain)Possession *possession;

@end
