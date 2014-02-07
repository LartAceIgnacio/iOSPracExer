//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Ace Ignacio on 2/5/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "ItemsViewController.h"
#import "Possession.h"
#import "PossessionStore.h"
#import "HomepwnerItemCell.h"

@implementation ItemsViewController

-(id)init
{
    //Call the superclass designated initializer;
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if(self) {
        //Create a new bar button item that will send
        //addNewPossession: to ItemsViewController
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPossession:)];
        
        //Select this bar as the right item in the navi bar
        [[self navigationItem] setRightBarButtonItem:bbi];
        
        //for the left button
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        
        //Set the title of the navibar
        [[self navigationItem] setTitle:@"Homepwner"];
    }
    
    //Manually add rows
    /*if(self) {
        for(int i = 0; i < 5; i++) {
            [[PossessionStore defaultStore] createPossession];
        }
    }
    */
    return self;
}

-(id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [[[PossessionStore defaultStore] allPossessions]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Get instance of a HomepwnerItemCell - either an unused one or a new one.
    //The method returns a UITableViewCell; we typecast it as a HomepwnerItemCell.
    HomepwnerItemCell *cell = (HomepwnerItemCell *)[tableView dequeueReusableCellWithIdentifier:@"HomepwnerItemCell"];
    
    if(!cell) {
        cell = [[HomepwnerItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomepwnerItemCell"];
    }
    
    NSArray *possessions = [[PossessionStore defaultStore] allPossessions];
    Possession *p = [possessions objectAtIndex:[indexPath row]];
    
    //Instead of setting each label directly, we pass it a possession object
    //It know how to configure its own subviews
    [cell setPossession:p];
 
    return cell;
}
    
-(IBAction)addNewPossession:(id)sender
{
    [[PossessionStore defaultStore] createPossession];
    
    //table view returns the controller's view
    [[self tableView]reloadData];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //If the table view is asking the delete command
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        PossessionStore *ps = [PossessionStore defaultStore];
        NSArray *posessions = [ps allPossessions];
        Possession *p = [posessions objectAtIndex:[indexPath row]];
        [ps removePossession:p];
        
        //We also remove that row from the table with an animation
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[PossessionStore defaultStore] movePossessionAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailViewController *detailViewController = [[ItemDetailViewController alloc]init];
    
    NSArray *possessions = [[PossessionStore defaultStore]allPossessions];
    
    //Give detail view controller a pointer to the possession object in row
    [detailViewController setPossession:[possessions objectAtIndex:[indexPath row]]];
    
    
    //push it onto the top of the navigation controller's stack
    [[self navigationController]pushViewController:detailViewController animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView]reloadData];
}


@end
