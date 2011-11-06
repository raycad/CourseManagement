//
//  StudentViewController.m
//  CourseManagement
//
//  Created by raycad on 10/21/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "StudentViewController.h"

@implementation StudentViewController

@synthesize student = m_student;
@synthesize fullNameTextField = m_fullNameTextField;
@synthesize dateOfBirthTextField = m_dateOfBirthTextField;
@synthesize idNumberTextField = m_idNumberTextField;
@synthesize addressTextField = m_addressTextField;
@synthesize phoneTextField = m_phoneTextField;

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
