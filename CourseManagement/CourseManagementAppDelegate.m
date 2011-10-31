//
//  CourseManagementAppDelegate.m
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "CourseManagementAppDelegate.h"
#import "CourseListViewController.h"
#import "StudentListViewController.h"

@implementation CourseManagementAppDelegate

@synthesize window = m_window;
@synthesize navigationController = m_navigationController;
@synthesize tabBarController = m_tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize view controller map
    m_viewControllerMap = [[NSMutableDictionary alloc] init];
    
    m_tabBarController = [[UITabBarController alloc] init];
    m_navigationController = [[UINavigationController alloc] init];
    
    UINavigationController *studentNavigationController = [[UINavigationController alloc] init];
    id studentListViewController = [self getViewControllerByIdString:(id)StudentListViewControllerIdString];
    if (studentListViewController) {
        [studentNavigationController pushViewController:studentListViewController animated:NO]; 
        ((StudentListViewController *)studentListViewController).title = StudentListViewTitle;        
    }

    UINavigationController *courseNavigationController = [[UINavigationController alloc] init];
    id courseListViewController = [self getViewControllerByIdString:(id)CourseListViewControllerIdString];
    if (courseListViewController) {
        [courseNavigationController pushViewController:courseListViewController animated:NO]; 
        ((CourseListViewController *)courseListViewController).title = CourseListViewTitle;
    }    
        
    m_tabBarController.viewControllers = [NSArray arrayWithObjects:courseNavigationController, studentNavigationController, nil];
    
    [self.window addSubview:[self.tabBarController view]];
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    [studentListViewController release];
    [courseListViewController release];
    
    [studentNavigationController release];
    [courseNavigationController release];
    
    /*id viewController = [self getViewControllerByIdString:(id)CourseViewControllerIdString];
    if (viewController)
        [viewController test];*/
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (id)createViewControllerByIdString:(NSString *)viewControllerIdString
{
    id viewController = nil;
    if (viewControllerIdString == CourseListViewControllerIdString) {
        viewController = [[CourseListViewController alloc] init];
    } else if (viewControllerIdString == StudentListViewControllerIdString) {
        viewController = [[StudentListViewController alloc] init];
    } /*else if (viewControllerIdString == CourseViewControllerIdString) {
        viewController = [[CourseViewController alloc] initWithNibName:@"CourseViewController" bundle:[NSBundle mainBundle]];
    } else if (viewControllerIdString == StudentViewControllerIdString) {
        viewController = [[CourseViewController alloc] initWithNibName:@"StudentViewController" bundle:[NSBundle mainBundle]];
    } else if (viewControllerIdString == InstructorViewControllerIdString) {
        viewController = [[CourseViewController alloc] initWithNibName:@"" bundle:[NSBundle mainBundle]];
    }*/ else
        return nil;
    
    return viewController;
}

- (id)getViewControllerByIdString:(NSString *)viewControllerIdString
{
    if (!m_viewControllerMap)
        return nil;
    
    id viewController = [m_viewControllerMap objectForKey:viewControllerIdString];
    if (!viewController) {
        // Create the view controller
        viewController = [self createViewControllerByIdString:viewControllerIdString];
        // Map the view controller
        [m_viewControllerMap setObject:viewController forKey:viewControllerIdString];    
        [viewController release];
    }
    
    return viewController;
}

- (void)releaseMemory
{       
    // Free momery of view controllers
    id viewController;
    NSArray *keys = [m_viewControllerMap allKeys];
    for (NSString *key in keys) {
        viewController = [m_viewControllerMap objectForKey:key];
        if (viewController) 
            [viewController release];
    }
    [m_viewControllerMap removeAllObjects];
    
    [m_window release];
    [m_navigationController release];
    [m_viewControllerMap release];
    [m_tabBarController release];
}

- (void)dealloc
{
    [self releaseMemory];
    [super dealloc];
}

@end
