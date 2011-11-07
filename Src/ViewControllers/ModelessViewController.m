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

- (void)selectAction:(id)sender
{
#pragma unused(sender)
    
    // Tell the delegate about the selection.    
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didSelect:)] ) {
        [self.delegate didSelect:self];
    }
}

- (void)updateAction:(id)sender
{
#pragma unused(sender)
    
    // Tell the delegate about the update.    
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didUpdate:)] ) {
        [self.delegate didUpdate:self];
    }
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

- (void)dealloc
{
    [m_delegate release];
    [super dealloc];
}

@end
