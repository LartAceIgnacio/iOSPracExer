//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Ace Ignacio on 2/5/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemDetailViewController.h"

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
    IBOutlet UIView *tableView;
    //__weak IBOutlet UITableViewCell *cell;
}

//-(UIView *)headerView;
-(IBAction)addNewPossession:(id)sender;
//-(IBAction)toggleEditingMode:(id)sender;




@end
