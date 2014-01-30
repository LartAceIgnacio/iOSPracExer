//
//  QuizViewController.m
//  Quiz
//
//  Created by Ace Ignacio on 1/30/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()



@end

@implementation QuizViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        //Create two arrays and make the pointers point to them
        questions = [[NSMutableArray alloc]init];
        answers = [[NSMutableArray alloc]init];
        
        //Assign values to the arrays
        [questions addObject:@"7 + 7 = ?"];
        [answers addObject:@"14"];
        
        [questions addObject:@"What is the capital of Philippines?"];
        [answers addObject:@"P"];
        
        [questions addObject:@"From what is Cognac made?"];
        [answers addObject:@"Letters"];
    }
    
    //return the address of the new object
    return  self;
}

-(IBAction)showQuestion:(id)sender
{
    //Move on to the next question
    currentQuestionIndex++;
    
    //Am I past the last question????
    if(currentQuestionIndex == [questions count]) {
        //Go back to the firstquesiton
        currentQuestionIndex = 0;
    }
    NSString *question = [questions objectAtIndex:currentQuestionIndex];
    
    //Log the quesiton
    NSLog(@"displaying question: %@",question);
    
    [questionField setText:question];
    
    [answerField setText:@"???"];
    
}

-(IBAction)showAnswer:(id)sender
{
    //What is the answer to the current question??
    NSString *answer = [answers objectAtIndex:currentQuestionIndex];
    
    //Display
    [answerField setText:answer];
}

@end







