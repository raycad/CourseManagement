//
//  CourseViewController.m
//  CourseManagement
//
//  Created by raycad on 10/29/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "CourseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "StudentViewCell.h"

@implementation CourseViewController

@synthesize titleTextField      = m_titleTextField;
@synthesize categoryTextField   = m_categoryTextField;
@synthesize descriptionTextView = m_descriptionTextView;
@synthesize addStudentButton    = m_addStudentButton;
@synthesize searchBar           = m_searchBar;
@synthesize studentTableView    = m_studentTableView;
@synthesize delegate            = m_delegate;
@synthesize course              = m_course;

- (id)init
{
    self = [super init];
    if (self != nil) {
        self.title = @"Add Course";       
    }
    return self;
}

- (void)saveAction:(id)sender
{
#pragma unused(sender)
    // Tell the delegate about the save.
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didSaveCourse:)]) {
        [self.delegate didSaveCourse:self];
    }
}

- (void)cancelAction:(id)sender
{
#pragma unused(sender)
    
    // Tell the delegate about the cancellation.
    
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didCancelCourse:)] ) {
        [self.delegate didCancelCourse:self];
    }
}

- (IBAction)addStudent:(id)sender {
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

- (IBAction)selectImage:(id)sender 
{
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [m_titleTextField release];
    [m_descriptionTextView release];
    [m_categoryTextField release];
    [m_course release];
    
    [m_addStudentButton release];
    [m_searchBar release];
    [m_studentTableView release];
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
    
    // Set default parameters   
    [m_descriptionTextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [m_descriptionTextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [m_descriptionTextView.layer setBorderWidth: 1.0];
    [m_descriptionTextView.layer setCornerRadius:10.0f];
    [m_descriptionTextView.layer setMasksToBounds:YES];
    
    UIImage *addImage = [UIImage imageNamed:@"add_student.png"];
    [m_addStudentButton setImage:addImage forState:UIControlStateNormal];
    
    if (m_course){
        m_titleTextField.text = m_course.title;
        m_descriptionTextView.text = m_course.description;
        m_categoryTextField.text = m_course.category;
        
        self.title = m_course.title;
    }
}

- (void)viewDidUnload
{
    [self setTitleTextField:nil];
    [self setDescriptionTextView:nil];
    [self setCategoryTextField:nil];
    [self setAddStudentButton:nil];
    [self setSearchBar:nil];
    [self setStudentTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@”contacts error in num of row”);
    return [m_studentModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    StudentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    /*if (cell == nil) {
     cell = [[[CourseViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
     }*/    
    if (cell == nil) {
		cell = [[[StudentViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        // Show row with the AccessoryDisclosureIndicator
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	}
    
    // Set up the cell...
    Student *student = [m_studentModel studentAtIndex:indexPath.row];
    if (!student)
        return nil;
	
    // Reset it to default values.
    
    cell.editingAccessoryView = nil;
    cell.detailTextLabel.text = nil;
    // Set cell selection is blue style
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    // Set up the cell…
    cell.fullNameLabel.text = [student fullName];
    cell.idNumberLabel.text = [student idNumber];
    if (student.sex == 0)
        cell.avatarImageView.image = [UIImage imageNamed:@"student_male.png"];
    else
        cell.avatarImageView.image = [UIImage imageNamed:@"student_female.png"];
    
    // Set data for cell
    cell.student = student;
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        StudentViewCell *cell = (StudentViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        assert(cell != nil);
        Student *student = cell.student;
        assert(student != nil);
        if ([m_studentModel removeStudent:student]) {
            [self refreshData];            
            NSLog(@"Remove course button was clicked");
        }
    }
}

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    if (tableView == m_studentTableView) {    
        StudentViewController *studentViewController = [[StudentViewController alloc] init];
        
        StudentViewCell *cell = (StudentViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        assert(cell != nil);
        Student *student = cell.student;
        assert(student != nil);
        
        studentViewController.student = student;
        
        [[self navigationController] pushViewController:studentViewController animated:YES];
        [studentViewController release];
    }
}*/

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // only show the status bar’s cancel button while in edit mode
    m_searchBar.showsCancelButton = YES;
    m_searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    m_searchBar.showsCancelButton = NO;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchBar != m_searchBar)
        return;
    
    [self refreshData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    @try{
        [m_studentModel copyDataFrom:m_course.studentModel];
        
        [m_studentTableView reloadData];
    }
    @catch(NSException *e){
    }
    [m_searchBar resignFirstResponder];
    m_searchBar.text = @"";
}

// called when Search (in our case “Done”) button pressed
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

- (BOOL)textView:(UITextView *)txtView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if( [text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location == NSNotFound ) {
        return YES;
    }
    
    [txtView resignFirstResponder];
    return NO;
}


@end
