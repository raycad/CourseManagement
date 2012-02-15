//
//  AppDelegate.h
//  CourseManagement
//
//  Created by Nguyen Duong on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSMutableDictionary *m_viewControllerMap;
    UITabBarController *m_tabBarController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

- (id)getViewControllerByIdString:(NSString *)viewControllerIdString;

@end
