//
//  StudentViewController.m
//  CourseManagement
//
//  Created by raycad on 10/21/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "StudentViewController.h"
#import "CMModel.h"

@implementation StudentViewController

@synthesize student = m_student;
@synthesize fullNameTextField = m_fullNameTextField;
@synthesize dateOfBirthTextField = m_dateOfBirthTextField;
@synthesize idNumberTextField = m_idNumberTextField;
@synthesize addressTextField = m_addressTextField;
@synthesize phoneTextField = m_phoneTextField;

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

- (void)updateAction:(id)sender
{
#pragma unused(sender)
    // Update the current student
    if(m_student) {
        NSString *idNumber = [self.idNumberTextField text];
        
        if ([idNumber isEqualToString:@""] || idNumber == nil) {
            // Open a alert with an OK button
            NSString *alertString = [NSString stringWithFormat:@"ID card number must not be empty"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            return;
        }
        
        CMModel *cmModel = [CMModel instance];
        StudentModel *studentModel = cmModel.studentModel;
        
        PersonPK *personPK = [[PersonPK alloc] initWithIdNumber:idNumber];
        PersonPK *currentPersonPK = [m_student personPK];
        
        if ((![personPK isEqual:currentPersonPK]) && [studentModel getStudentByPK:personPK] != nil) {
            // Open a alert with an OK button
            NSString *alertString = [NSString stringWithFormat:@"The student is existing"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            return;
        }
        
        NSString *fullName = [self.fullNameTextField text];
        NSString *dateOfBirth = [self.dateOfBirthTextField text];
        NSString *address = [self.addressTextField text];
        NSString *phoneNumber = [self.phoneTextField text];
        
        m_student.idNumber = idNumber;
        m_student.fullName = fullName;
        m_student.dateOfBirth = dateOfBirth;
        m_student.address = address;
        m_student.mobilePhoneNumber = phoneNumber;
    }
    
    // Tell the delegate about the update.    
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didUpdate:)] ) {
        [self.delegate didUpdate:self];
    }
}
@end
