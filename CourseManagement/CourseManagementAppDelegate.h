//
//  CourseManagementAppDelegate.h
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseViewController.h"
#import "Common.h"

@interface CourseManagementAppDelegate : NSObject <UIApplicationDelegate> {
    NSMutableDictionary *m_viewControllerMap;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) CourseViewController *courseViewController;

- (id)getViewControllerByIdString:(NSString *)viewControllerIdString;
@end
