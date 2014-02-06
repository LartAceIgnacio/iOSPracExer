//
//  FileHelper.m
//  Homepwner
//
//  Created by Ace Ignacio on 2/6/14.
//  Copyright (c) 2014 Ace Ignacio. All rights reserved.
//

#import "FileHelper.h"

//To use this function you pass it a file name, and it will construct
// the full path for that file in the documents directory
NSString *pathInDocumentDirectory(NSString *filename)
{
    //Get list of document directories in sandbox
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    
    //Get one and only document directory from that list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    //Append passed in a file name to that directory, return it.
    return [documentDirectory stringByAppendingPathComponent:filename];
}
