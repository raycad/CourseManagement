//
//  CourseManagementAppDelegate.m
//  CourseManagement
//
//  Created by raycad on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CourseManagementAppDelegate.h"

@implementation CourseManagementAppDelegate

@synthesize window = m_window;
@synthesize courseViewController = m_courseViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize view controller map
    m_viewControllerMap = [[NSMutableDictionary alloc] init];
    
    id mainViewController = [self getViewControllerByIdString:(id)CourseViewControllerIdString];
    if (mainViewController)
        [self.window addSubview:[mainViewController view]];    
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    id viewController = [self getViewControllerByIdString:(id)CourseViewControllerIdString];
    if (viewController)
        [viewController test];
    
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
    if (viewControllerIdString == CourseViewControllerIdString) {
        viewController = [[CourseViewController alloc] initWithNibName:@"CourseViewController" bundle:[NSBundle mainBundle]];
    } else if (viewControllerIdString == StudentViewControllerIdString) {
        viewController = [[CourseViewController alloc] initWithNibName:@"StudentViewController" bundle:[NSBundle mainBundle]];
    } else if (viewControllerIdString == InstructorViewControllerIdString) {
        viewController = [[CourseViewController alloc] initWithNibName:@"" bundle:[NSBundle mainBundle]];
    } else
        return nil;
    
    return [viewController autorelease];
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
    }
    
    return viewController;
}

- (void)releaseMemory
{
    [m_window release];
    [m_viewControllerMap release];
}

- (void)dealloc
{
    [self releaseMemory];
    [super dealloc];
}

@end
