//
//  AssetTypePicker.m
//  Homepwner
//
//  Created by Ace Ignacio on 2/7/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "AssetTypePicker.h"
#import "PossessionStore.h"
#import "Possession.h"

@implementation AssetTypePicker

@synthesize possession;

-(id)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[PossessionStore defaultStore]allAssetTypes]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    NSArray *allAssets = [[PossessionStore defaultStore]allAssetTypes];
    NSManagedObject *assetType = [allAssets objectAtIndex:[indexPath row]];
    
    ///Use key value coding to get the asset type's label
    NSString *assetLabel = [assetType valueForKey:@"label"];
    [[cell textLabel] setText:assetLabel];
    
    //Checkmark the one that is currently selected
    if(assetType == [possession assetType]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    NSArray *allAssets = [[PossessionStore defaultStore]allAssetTypes];
    NSManagedObject *assetType = [allAssets objectAtIndex:[indexPath row]];
    [possession setAssetType:assetType];
    
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
