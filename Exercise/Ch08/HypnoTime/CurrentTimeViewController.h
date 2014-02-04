//
//  CurrentTimeViewController.h
//  HypnoTime
//
//  Created by Ace Ignacio on 2/4/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentTimeViewController : UIViewController
{
    IBOutlet UILabel *lblTime;
    IBOutlet UIButton *btnPress;
}

-(IBAction)showCurrentTime:(id)sender;

@end
