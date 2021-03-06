//
//  CourseListViewController.m
//  CourseManagement
//
//  Created by raycad on 10/23/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "CourseListViewController.h"
#import "CourseViewCell.h"
#import "CourseViewController.h"
#import "Common.h"

@implementation CourseListViewController
@synthesize courseTableView = m_courseTableView;
@synthesize searchBar = m_searchBar;

- (id)init
{
    //self = [super initWithStyle:UITableViewStyleGrouped];
    self = [super init];
    if (self != nil) {
        // Initialize the course model
        m_courseModel = [[CourseModel alloc] init];  
        m_cmModel = [CMModel instance];

        // Set up our navigation bar.
        self.title = CourseListViewTitle;        
        self.tabBarItem.image = [UIImage imageNamed:@"course.png"];        
    }
    
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)loadDataFromDB
{
    if (m_cmModel.courseModel == nil) {
        CourseModel *courseModel = [[CourseModel alloc] init];
        
        NSString *title = nil;
        CoursePK *coursePK = nil;
        Course *course = nil;
        
        title = [NSString stringWithFormat:@"iOS Programming"];
        coursePK = [[CoursePK alloc] initWithCourseTitle:title];
        course = [[Course alloc] initWithCoursePK:coursePK];
        [course setTitle:title];
        [course setCategory:@"IOS"];
        [course setDescription:@"Course for developing IOS skill"];    
        if ([courseModel addCourse:course]) {
            NSLog(@"Added sucessfully");
        }
        
        title = [NSString stringWithFormat:@"Android Programming"];
        coursePK = [[CoursePK alloc] initWithCourseTitle:title];
        course = [[Course alloc] initWithCoursePK:coursePK];
        [course setTitle:title];
        [course setCategory:@"Android"];
        [course setDescription:@"Course for developing Android skill"];    
        if ([courseModel addCourse:course]) {
            NSLog(@"Added sucessfully");
        }
        
        title = [NSString stringWithFormat:@"Windows Phone 12/12/2011"];
        coursePK = [[CoursePK alloc] initWithCourseTitle:title];
        course = [[Course alloc] initWithCoursePK:coursePK];
        [course setTitle:title];
        [course setCategory:@"Windows phone"];
        [course setDescription:@"Course for developing IOS skill"];    
        if ([courseModel addCourse:course]) {
            NSLog(@"Added sucessfully");
        }
        
        title = [NSString stringWithFormat:@"Windows Phone 30/12/2011"];
        coursePK = [[CoursePK alloc] initWithCourseTitle:title];
        course = [[Course alloc] initWithCoursePK:coursePK];
        [course setTitle:title];
        [course setCategory:@"Windows phone"];
        [course setDescription:@"Course for developing IOS skill"];    
        if ([courseModel addCourse:course]) {
            NSLog(@"Added sucessfully");
        }
        
        title = [NSString stringWithFormat:@"C++ Programming 01/11/2011"];
        coursePK = [[CoursePK alloc] initWithCourseTitle:title];
        course = [[Course alloc] initWithCoursePK:coursePK];
        [course setTitle:title];
        [course setCategory:@"C++"];
        [course setDescription:@"Course for developing C++ skill"];    
        if ([courseModel addCourse:course]) {
            NSLog(@"Added sucessfully");
        }
        
        title = [NSString stringWithFormat:@"Java Programming 01/11/2011"];
        coursePK = [[CoursePK alloc] initWithCourseTitle:title];
        course = [[Course alloc] initWithCoursePK:coursePK];
        [course setTitle:title];
        [course setCategory:@"Java"];
        [course setDescription:@"Course for developing Java skill"];    
        if ([courseModel addCourse:course]) {
            NSLog(@"Added sucessfully");
        }        

        // Set data model
        [m_cmModel setCourseModel:courseModel];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the table view    
    m_courseTableView.editing = YES;
    m_courseTableView.allowsSelectionDuringEditing = YES;
    
    if (m_viewMode == CreateNewMode) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshData)];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCourse)];
    }
    
    [self loadDataFromDB];
    
    // Reload data
    [self refreshData];
}

- (void)viewDidUnload {
    [self setCourseTableView:nil];
    [self setSearchBar:nil];
    [super viewDidUnload];
}

/*- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [m_courseModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CourseViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    /*if (cell == nil) {
        cell = [[[CourseViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }*/    
    if (cell == nil) {
		cell = [[CourseViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
        // Show row with the AccessoryDisclosureIndicator
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	}
    
    // Set up the cell...
    Course *course = [m_courseModel courseAtIndex:indexPath.row];
    if (!course)
        return nil;
	
    // Reset it to default values.
    
    cell.editingAccessoryView = nil;
    cell.detailTextLabel.text = nil;
    // Set cell selection is blue style
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;

    // Set up the cell…
    cell.titleLabel.text = [course title];
    cell.categoryLabel.text = [course category];
    cell.thumbnailImageView.image = [UIImage imageNamed:@"xcode.png"];
    
    // Set data for cell
    cell.course = course;
    
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
    CourseModel *courseModel = m_cmModel.courseModel;
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CourseViewCell *cell = (CourseViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        assert(cell != nil);
        Course *course = cell.course;
        assert(course != nil);
        if ([courseModel removeCourse:course]) {
            [self refreshData];
            //[m_courseTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            NSLog(@"Remove course button was clicked");
        }
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (m_courseTableView == tableView && (m_viewMode != SelectMode)) {
        // Navigation logic may go here. Create and push another view controller.
        CourseViewController *courseViewController = [[CourseViewController alloc] init];
        
        CourseViewCell *cell = (CourseViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        assert(cell != nil);
        Course *course = cell.course;
        assert(course != nil);
        
        courseViewController.course = course;
        courseViewController.viewMode = UpdateMode;
        courseViewController.delegate = self;
        
        [[self navigationController] pushViewController:courseViewController animated:YES];
    }
}

- (void)presentCourseViewModally
// Displays the options view so that the user can add a new number to the 
// list of numbers to add up.
{
    CourseViewController * vc;
    
    vc = [[CourseViewController alloc] init];
    assert(vc != nil);
    
    vc.delegate = self;
    
    [vc presentModallyOn:self];
}

- (void)addCourse
{
    [self presentCourseViewModally];  
}

- (void)refreshData
{
    NSString *searchText = m_searchBar.text;
    if([searchText isEqualToString:@""] || (searchText == nil)){
        [m_courseModel copyDataFrom:m_cmModel.courseModel];
        
        [m_courseTableView reloadData];
        return;
    }
    
    // Filter course by title
    CourseModel *courseModel = [m_cmModel.courseModel searchByTitle:searchText];
    if (courseModel == nil)
        [m_courseModel clear];
    else {
        [m_courseModel copyDataFrom:courseModel];
        //[courseModel release]; // Cause the crash
    }
    
    [m_courseTableView reloadData];
    
    /*NSString *title = [NSString stringWithFormat:@"%@ (%d)", CourseListViewTitle, [m_courseModel count]];
    self.title = title;*/
}

- (void)didSave:(NSObject *)object
{
#pragma unused(object)
    assert(object != nil);
    CourseViewController *courseViewController = (CourseViewController *)object;
    
    NSString *title = [courseViewController.titleTextField text];
    
    if ([title isEqualToString:@""]) {
        // Open a alert with an OK button
        NSString *alertString = [NSString stringWithFormat:@"Title must not be empty"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        return;
    }

    NSString *category = [courseViewController.categoryTextField text];
    NSString *description = [courseViewController.descriptionTextView text];
    StudentModel *studentModel = [courseViewController studentModel];
    
    CoursePK *coursePK = [[CoursePK alloc] initWithCourseTitle:title];
    Course *course = [[Course alloc] initWithCoursePK:coursePK];
    [course setTitle:title];
    [course setCategory:category];
    [course setDescription:description];
    [course setStudentModel:studentModel];
    
    CourseModel *courseModel = m_cmModel.courseModel;
    
    if (![courseModel addCourse:course]) {
        // Open a alert with an OK button
        NSString *alertString = [NSString stringWithFormat:@"The course is existing"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        return;
    }
        
    [self dismissModalViewControllerAnimated:YES];
    
    [self refreshData];
}

- (void)didCancel:(NSObject *)object
// Called when the user taps Cancel in the options view.
{
#pragma unused(object)
    assert(object != nil);
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didUpdate:(NSObject *)object
// Called when the user taps Cancel in the options view.
{
#pragma unused(object)
    assert(object != nil);
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    [self refreshData];
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
        [m_courseModel copyDataFrom:m_cmModel.courseModel];
        
        [m_courseTableView reloadData];
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
