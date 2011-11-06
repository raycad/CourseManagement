//
//  StudentListViewController.m
//  CourseManagement
//
//  Created by raycad on 10/31/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "StudentListViewController.h"
#import "Common.h"
#import "StudentViewController.h"
#import "StudentViewCell.h"

@implementation StudentListViewController

@synthesize searchBar = m_searchBar;
@synthesize studentTableView = m_studentTableView;

- (void)loadDataFromDB
{
    StudentModel *studentModel = [[StudentModel alloc] init];
    
    NSString *idNumber = nil;
    PersonPK *personPK = nil;
    Student *student = nil;    
    
    idNumber = [NSString stringWithFormat:@"172062231"];
    personPK = [[PersonPK alloc] initWithIdNumber:idNumber];
    student = [[Student alloc] initWithPersonPK:personPK];
    [student setAddress:@"Tay Mo street"];
    student.dateOfBirth = @"27/06/1982";
    student.fullName = @"Raycad";  
    student.mobilePhoneNumber = @"0989641245";
    student.idNumber = idNumber;
    student.sex = 0;
    if ([studentModel addStudent:student]) {
        NSLog(@"Added sucessfully");
    }
    [idNumber release];
    [personPK release];
    [student release];  
    
    idNumber = [NSString stringWithFormat:@"337789"];
    personPK = [[PersonPK alloc] initWithIdNumber:idNumber];
    student = [[Student alloc] initWithPersonPK:personPK];
    [student setAddress:@"33 Phan Boi Chau street"];
    student.dateOfBirth = @"12/3/1980";
    student.fullName = @"Hamman";  
    student.mobilePhoneNumber = @"0975641245";
    student.idNumber = idNumber;
    student.sex = 0;
    if ([studentModel addStudent:student]) {
        NSLog(@"Added sucessfully");
    }
    [idNumber release];
    [personPK release];
    [student release];  
    
    idNumber = [NSString stringWithFormat:@"123456"];
    personPK = [[PersonPK alloc] initWithIdNumber:idNumber];
    student = [[Student alloc] initWithPersonPK:personPK];
    [student setAddress:@"123 Nguyen Chi Thanh street"];
    student.dateOfBirth = @"4/8/1990";
    student.fullName = @"Marry";  
    student.mobilePhoneNumber = @"0989641245";
    student.idNumber = idNumber;
    student.sex = 1;
    if ([studentModel addStudent:student]) {
        NSLog(@"Added sucessfully");
    }
    [idNumber release];
    [personPK release];
    [student release];  
    
    idNumber = [NSString stringWithFormat:@"2255678"];
    personPK = [[PersonPK alloc] initWithIdNumber:idNumber];
    student = [[Student alloc] initWithPersonPK:personPK];
    [student setAddress:@"55 Kim Ma street"];
    student.dateOfBirth = @"23/8/1983";
    student.fullName = @"Linda";  
    student.mobilePhoneNumber = @"0985504455";
    student.idNumber = idNumber;
    student.sex = 1;
    if ([studentModel addStudent:student]) {
        NSLog(@"Added sucessfully");
    }
    [idNumber release];
    [personPK release];
    [student release];  
    
    // Set data model
    [m_cmModel setStudentModel:studentModel];
   
    [studentModel release];
}

- (id)init
{
    //self = [super initWithStyle:UITableViewStyleGrouped];
    self = [super init];
    if (self != nil) {
        // Initialize the student model
        m_studentModel = [[StudentModel alloc] init];
        m_cmModel = [CMModel instance];
        
        // Set up our navigation bar.
        self.title = StudentListViewTitle;
        self.tabBarItem.image = [UIImage imageNamed:@"student_male.png"];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshData)];        
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addStudent)];
    }    
        
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the table view    
    self.studentTableView.editing = YES;
    self.studentTableView.allowsSelectionDuringEditing = YES;
    
	[self loadDataFromDB];
    
    // Reload data
    [self refreshData];
}

- (void)dealloc
{
    [m_studentModel release];
    [m_searchBar release];
    [m_studentTableView release];
    [super dealloc];
}

- (void)addStudent
{
    [self presentStudentViewModally];
}

- (void)refreshData 
{
    NSString *searchText = m_searchBar.text;
    if([searchText isEqualToString:@""] || (searchText == nil)){
        [m_studentModel copyDataFrom:m_cmModel.studentModel];
        
        [m_studentTableView reloadData];
        return;
    }
    
    // Filter student by name
    StudentModel *studentModel = [m_cmModel.studentModel searchByName:searchText];
    if (studentModel == nil)
        [m_studentModel clear];
    else {
        [m_studentModel copyDataFrom:studentModel];
        //[studentModel release]; // Cause the crash
    }
    
    [m_studentTableView reloadData];
}

- (void)presentStudentViewModally
// Displays the options view so that the user can add a new number to the 
// list of numbers to add up.
{
    StudentViewController * vc;
    
    vc = [[[StudentViewController alloc] init] autorelease];
    assert(vc != nil);
    
    vc.delegate = self;
    
    [vc presentModallyOn:self];
}

- (void)didSave:(NSObject *)object
{
    assert(object != nil);
    
    StudentViewController *studentViewController = (StudentViewController *)object;
    NSString *idNumber = [studentViewController.idNumberTextField text];
    
    if ([idNumber isEqualToString:@""] || idNumber == nil) {
        // Open a alert with an OK button
        NSString *alertString = [NSString stringWithFormat:@"ID card number must not be empty"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        return;
    }
    
    NSString *fullName = [studentViewController.fullNameTextField text];
    NSString *dateOfBirth = [studentViewController.dateOfBirthTextField text];
    NSString *address = [studentViewController.addressTextField text];
    NSString *phoneNumber = [studentViewController.phoneTextField text];
    
    PersonPK *personPK = [[PersonPK alloc] initWithIdNumber:idNumber];
    Student *student = [[Student alloc] initWithPersonPK:personPK];
    student.idNumber = idNumber;
    student.fullName = fullName;
    student.dateOfBirth = dateOfBirth;
    student.address = address;
    student.mobilePhoneNumber = phoneNumber;
    
    StudentModel *studentModel = m_cmModel.studentModel;
    
    if (![studentModel addStudent:student]) {
        // Open a alert with an OK button
        NSString *alertString = [NSString stringWithFormat:@"The student is existing"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        return;
    }
    
    [self dismissModalViewControllerAnimated:YES];
    
    [self refreshData];
}

- (void)didCancel:(NSObject *)object
// Called when the user taps Cancel in the options view.
{
    [self dismissModalViewControllerAnimated:YES];
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

//This defines for each row its editing style, i.e. whether it shows a remove sign (Red circle with subtract sign) or 
//and add sign (Green circle with addition sign). I have hard coded the first row (the one that says "New Item") to display the add sign and all others to display the subtract sign. 
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

//This method is invoked when the user has finished editing one of the rows of the table. The three parameters
//respectivly proivide, the table being edited, the style of the row being edited (Add or Delete) and the row being 
//edited. If the style is delete we remove the corresponding item from the data source and then delete the row from 
///the view. If the style was add we add another element to the data source and relode the data into the table view.
//In reality add item will probably load a new view which allows the user to enter text but that is left to another 
//tutorial for now we are hard coding the text to be added.   
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentModel *studentModel = m_cmModel.studentModel;
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        StudentViewCell *cell = (StudentViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        assert(cell != nil);
        Student *student = cell.student;
        assert(student != nil);
        if ([studentModel removeStudent:student]) {
            [self refreshData];
            //[m_studentTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            NSLog(@"Remove course button was clicked");
        }
    }
}

- (void)viewDidUnload {
    [self setSearchBar:nil];
    [self setStudentTableView:nil];
    [super viewDidUnload];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (m_viewMode != SelectMode) {
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
    } else {
        if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(didSelect:)] ) {
            StudentViewCell *cell = (StudentViewCell *)[tableView cellForRowAtIndexPath:indexPath];
            assert(cell != nil);
            Student *student = cell.student;
            assert(student != nil);
            [self.delegate didSelect:student];
        }
    }
}

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
        [m_studentModel copyDataFrom:m_cmModel.studentModel];
        
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

@end
