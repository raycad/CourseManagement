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
#import "StudentListViewController.h"
#import "CMModel.h"

@implementation CourseViewController

@synthesize titleTextField      = m_titleTextField;
@synthesize categoryTextField   = m_categoryTextField;
@synthesize descriptionTextView = m_descriptionTextView;
@synthesize addStudentButton    = m_addStudentButton;
@synthesize searchBar           = m_searchBar;
@synthesize studentTableView    = m_studentTableView;
@synthesize course              = m_course;
@synthesize studentModel        = m_studentModel;

- (id)init
{
    self = [super init];
    if (self != nil) {
        self.title = @"Add Course";    
        m_studentModel = [[StudentModel alloc] init];        
        m_filterStudentModel = [[StudentModel alloc] init];
    }
    return self;
}

- (IBAction)addStudent:(id)sender
{
    StudentListViewController * vc;
    
    vc = [[StudentListViewController alloc] init];
    assert(vc != nil);
    
    vc.viewMode = SelectMode;
    
    vc.delegate = self;    
    
    [vc presentModallyOn:self];
}

#pragma mark - View lifecycle

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

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
        if (m_course.studentModel) {
            self.studentModel = m_course.studentModel;
        }
        
        self.title = m_course.title;
    }
    
    // Configure the table view    
    self.studentTableView.editing = YES;
    self.studentTableView.allowsSelectionDuringEditing = YES;
    
    // Reload data
    [self refreshData];
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
    return [m_filterStudentModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    StudentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    /*if (cell == nil) {
     cell = [[[CourseViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
     }*/    
    if (cell == nil) {
		cell = [[StudentViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
        // Show row with the AccessoryDisclosureIndicator
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	}
    
    // Set up the cell...
    Student *student = [m_filterStudentModel studentAtIndex:indexPath.row];
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
        [m_filterStudentModel copyDataFrom:m_studentModel];
        
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

- (void)didSelect:(NSObject *)object
// Called when the user taps Cancel in the options view.
{
    assert(object != nil);
    
    Student *student = (Student *)object;    
    
    if (![m_studentModel addStudent:student]) {
        // Open a alert with an OK button
        NSString *alertString = [NSString stringWithFormat:@"The student is existing"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    [self refreshData];

    [self dismissModalViewControllerAnimated:YES];
}

- (void)refreshData 
{
    NSString *searchText = m_searchBar.text;
    if([searchText isEqualToString:@""] || (searchText == nil)){
        [m_filterStudentModel copyDataFrom:m_studentModel];
        
        [m_studentTableView reloadData];
        return;
    }
    
    // Filter student by name
    StudentModel *studentModel = [m_studentModel searchByName:searchText];
    if (studentModel == nil)
        [m_filterStudentModel clear];
    else {
        [m_filterStudentModel copyDataFrom:studentModel];
    }
    
    [m_studentTableView reloadData];
}

- (void)updateAction:(id)sender
{
#pragma unused(sender)
    // Update the current course
    if(m_course) {
        NSString *title = [self.titleTextField text];
        
        if ([title isEqualToString:@""]) {
            // Open a alert with an OK button
            NSString *alertString = [NSString stringWithFormat:@"Title must not be empty"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            return;
        }
        
        NSString *category = [self.categoryTextField text];
        NSString *description = [self.descriptionTextView text];
        
        CMModel *cmModel = [CMModel instance];
        CourseModel *courseModel = cmModel.courseModel;
        
        CoursePK *coursePK = [[CoursePK alloc] initWithCourseTitle:title];
        CoursePK *currentCoursePK = [m_course coursePK];
        
        if ((![coursePK isEqual:currentCoursePK]) && [courseModel getCourseByPK:coursePK] != nil) {
            // Open a alert with an OK button
            NSString *alertString = [NSString stringWithFormat:@"The course is existing"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            return;
        }
        
        [m_course setTitle:title];
        [m_course setCategory:category];
        [m_course setDescription:description];
        
        // Reset coursePK
        [m_course coursePK].courseTitle = title;
    }
    
    // Tell the delegate about the update.    
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didUpdate:)] ) {
        [self.delegate didUpdate:self];
    }
}
@end
