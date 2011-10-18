//
//  CourseManagementAppDelegate.h
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseViewController.h"

@interface CourseManagementAppDelegate : NSObject <UIApplicationDelegate> {
@private
    CourseViewController *m_courseViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) CourseViewController *courseViewController;

@end
