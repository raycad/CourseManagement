//
//  CourseManagementAppDelegate.h
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface CourseManagementAppDelegate : NSObject <UIApplicationDelegate> {
    NSMutableDictionary *m_viewControllerMap;
    UINavigationController *m_navigationController;
    UITabBarController *m_tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

- (id)getViewControllerByIdString:(NSString *)viewControllerIdString;
@end
