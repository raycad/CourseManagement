//
//  SdtViewController.m
//  CourseManagement
//
//  Created by raycad on 11/7/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "SdtViewController.h"


@implementation SdtViewController

@synthesize viewMode = m_viewMode;

- (id)init
{
    self = [super init];
    if (self != nil) {
        m_viewMode = CreateNewMode;
    }
    
    return self;
}

- (void)presentModallyOn:(UIViewController *)parent
{
    UINavigationController *nav;        
    // Create a navigation controller with us as its root.    
    nav = [[[UINavigationController alloc] initWithRootViewController:self] autorelease];
    assert(nav != nil);    
        
    // Present the navigation controller on the specified parent 
    // view controller.    
    [parent presentModalViewController:nav animated:YES]; 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (m_viewMode == CreateNewMode) {        
        // Set up the Save & Cancel buttons on the right & left of the navigation bar.    
        self.navigationItem.leftBarButtonItem  = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)] autorelease];
        assert(self.navigationItem.leftBarButtonItem != nil);
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave   target:self action:@selector(saveAction:)] autorelease];
        assert(self.navigationItem.rightBarButtonItem != nil);         
    } else if (m_viewMode == SelectMode) {
        // Do something
    } else if (m_viewMode == UpdateMode) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(updateAction:)];
    }
}

- (void)dealloc
{
    [super dealloc];
}

@end
