//
//  ModelessViewController.m
//  CourseManagement
//
//  Created by raycad on 11/6/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "ModelessViewController.h"

@implementation ModelessViewController

@synthesize delegate = m_delegate;

- (void)saveAction:(id)sender
{
#pragma unused(sender)
    // Tell the delegate about the save.
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didSave:)]) {
        [self.delegate didSave:self];
    }
}

- (void)cancelAction:(id)sender
{
#pragma unused(sender)
    
    // Tell the delegate about the cancellation.    
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didCancel:)] ) {
        [self.delegate didCancel:self];
    }
}

- (void)presentModallyOn:(UIViewController *)parent
{
    UINavigationController *nav;
    
    // Create a navigation controller with us as its root.    
    nav = [[[UINavigationController alloc] initWithRootViewController:self] autorelease];
    assert(nav != nil);
    
    // Set up the Save & Cancel buttons on the right & left of the navigation bar.    
    self.navigationItem.leftBarButtonItem  = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)] autorelease];
    assert(self.navigationItem.leftBarButtonItem != nil);
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave   target:self action:@selector(saveAction:)] autorelease];
    assert(self.navigationItem.rightBarButtonItem != nil);
    
    // Present the navigation controller on the specified parent 
    // view controller.    
    [parent presentModalViewController:nav animated:YES];
}

- (void)dealloc
{
    [m_delegate release];
    [super dealloc];
}

@end
