//
//  StudentViewController.m
//  CourseManagement
//
//  Created by raycad on 10/21/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "StudentViewController.h"

@implementation StudentViewController

@synthesize delegate = m_delegate;
@synthesize student = m_student;
@synthesize fullNameTextField = m_fullNameTextField;
@synthesize dateOfBirthTextField = m_dateOfBirthTextField;
@synthesize idNumberTextField = m_idNumberTextField;
@synthesize addressTextField = m_addressTextField;
@synthesize phoneTextField = m_phoneTextField;

- (void)saveAction:(id)sender
{
#pragma unused(sender)
    // Tell the delegate about the save.
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didSaveStudent:)]) {
        [self.delegate didSaveStudent:self];
    }
}

- (void)cancelAction:(id)sender
{
#pragma unused(sender)
    
    // Tell the delegate about the cancellation.
    
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didCancelStudent:)] ) {
        [self.delegate didCancelStudent:self];
    }
}

- (void)presentModallyOn:(UIViewController *)parent
{
    UINavigationController *nav;
    
    // Create a navigation controller with us as its root.
    
    nav = [[[UINavigationController alloc] initWithRootViewController:self] autorelease];
    assert(nav != nil);
    
    // Set up the Cancel button on the left of the navigation bar.    
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
    [m_student release];
    
    [m_fullNameTextField release];
    [m_dateOfBirthTextField release];
    [m_idNumberTextField release];
    [m_addressTextField release];
    [m_phoneTextField release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (m_student) {
        m_fullNameTextField.text = m_student.fullName;
        m_dateOfBirthTextField.text = m_student.dateOfBirth;
        m_idNumberTextField.text = m_student.idNumber;
        m_addressTextField.text = m_student.address;
        m_phoneTextField.text = m_student.mobilePhoneNumber;
        
        self.title = m_student.fullName;
    }
}

- (void)viewDidUnload
{
    [self setFullNameTextField:nil];
    [self setDateOfBirthTextField:nil];
    [self setIdNumberTextField:nil];
    [self setAddressTextField:nil];
    [self setPhoneTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

@end
