//
//  QuizViewController.h
//  Quiz
//
//  Created by Ace Ignacio on 1/30/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController
{
    int currentQuestionIndex;
    
    //Model
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    //View
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
    
}

-(IBAction)showQuestion:(id)sender;
-(IBAction)showAnswer:(id)sender;

@end
