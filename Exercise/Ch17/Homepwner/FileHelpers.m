//
//  FileHelpers.m
//  Homepwner
//
//  Created by Ace Ignacio on 2/7/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "FileHelpers.h"

//To use this function, you pass it a file name, and it will construct
//the full path for that file in the documents directory.

NSString *pathInDocumentDirectory(NSString *filename)
{
    //Get list of documents directories in sandbox
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //before NSDocumentDirectory it is NSDocumentationDirectory
    
    
    //Get one and only document direcotory from the list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    //Append passed in file name to that directory, return it
    return [documentDirectory stringByAppendingPathComponent:filename];
}
