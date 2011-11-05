//
//  main.m
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMModel.h"

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // Initialize the app model
    CMModel *cmModel = [CMModel instance];
    
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    [cmModel release];
    
    return retVal;
}
