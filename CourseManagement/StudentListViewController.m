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

@implementation StudentListViewController

@synthesize searchBar = m_searchBar;
@synthesize studentTableView = m_studentTableView;

- (id)init
{
    //self = [super initWithStyle:UITableViewStyleGrouped];
    self = [super init];
    if (self != nil) {
        // Initialize the course model
        m_studentModel = [StudentModel instance];
        
        // Set up our navigation bar.
        self.title = StudentListViewTitle;
        self.tabBarItem.image = [UIImage imageNamed:@"student.png"];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(removeStudent)];        
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addStudent)];
    }    
        
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.studentTableView reloadData];
	self.studentTableView.scrollEnabled = YES;
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
    [self presentCourseViewModally];
}

- (void)removeStudent 
{
}

- (void)presentCourseViewModally
// Displays the options view so that the user can add a new number to the 
// list of numbers to add up.
{
    StudentViewController * vc;
    
    vc = [[[StudentViewController alloc] init] autorelease];
    assert(vc != nil);
    
    vc.delegate = self;
    
    [vc presentModallyOn:self];
}

- (void)didSaveStudent:(StudentViewController *)controller
// Called when the user taps Save in the options view.  The options 
// view has already saved the options, so we have nothing to do other 
// than to tear down the view.
{
#pragma unused(controller)
    assert(controller != nil);
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didCancelStudent:(StudentViewController *)controller
// Called when the user taps Cancel in the options view.
{
#pragma unused(controller)
    assert(controller != nil);
    [self dismissModalViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@”contacts error in num of row”);
    return 2;//[m_studentModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.text = @"TTTT"; 
    return cell;
}

- (void)viewDidUnload {
    [self setSearchBar:nil];
    [self setStudentTableView:nil];
    [super viewDidUnload];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *detailsViewController = [[UIViewController alloc] init];
    
    detailsViewController.title = @"raycad";
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // only show the status bar’s cancel button while in edit mode
    m_searchBar.showsCancelButton = YES;
    m_searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    // flush the previous search content
    [m_studentTableView removeAllObjects];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    m_searchBar.showsCancelButton = NO;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [m_studentTableView removeAllObjects];// remove all data that belongs to previous search
    if([searchText isEqualToString:@""] || (searchText == nil)){
        [m_studentTableView reloadData];
        return;
    }
    NSInteger counter = 0;
    /*for(NSString *name in dataSource) {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
        NSRange r = [name rangeOfString:searchText];
        if(r.location != NSNotFound)
        {
            if(r.location== 0)//that is we are checking only the start of the names.
            {
                [tableData addObject:name];
            }
        }
        counter++;
        [pool release];
    }*/	
    [m_studentTableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    // if a valid search was entered but the user wanted to cancel, bring back the main list content
    [m_studentTableView removeAllObjects];
    //[m_studentTableView addObjectsFromArray:dataSource];
    @try{
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
