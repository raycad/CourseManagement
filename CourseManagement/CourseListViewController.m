//
//  CourseListViewController.m
//  CourseManagement
//
//  Created by raycad on 10/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CourseListViewController.h"
#import "Course.h"

@implementation CourseListViewController

- (id)init
{
    //self = [super initWithStyle:UITableViewStyleGrouped];
    self = [super init];
    if (self != nil) {
        // Set up some private properties.
        
        // Set up our navigation bar.
        
        self.title = @"Course List";
        
        self.navigationItem.leftBarButtonItem  = [[[UIBarButtonItem alloc] initWithTitle:@"Minimum" style:UIBarButtonItemStyleBordered target:self action:@selector(defaultsMinimumAction:)] autorelease];
        
        /*self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Options" style:UIBarButtonItemStyleBordered target:self action:@selector(optionsAction:)        ] autorelease];*/
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCourse)];
        
        self.navigationItem.leftBarButtonItem.possibleTitles = [NSSet setWithObjects:@"Defaults", @"Minimum", nil];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [m_listOfItems release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure our table view.
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //Initialize the array.
	m_listOfItems = [[NSMutableArray alloc] init];
    
    //Add items
    [m_listOfItems addObject:@"Iceland"];
    [m_listOfItems addObject:@"Greenland"];
    [m_listOfItems addObject:@"Switzerland"];
    [m_listOfItems addObject:@"Norway"];
    [m_listOfItems addObject:@"New Zealand"];
    [m_listOfItems addObject:@"Greece"];
    [m_listOfItems addObject:@"Rome"];
    [m_listOfItems addObject:@"Ireland"];
    
    //Set the title
    //self.navigationItem.title = @"Countries";
    
    [self addObserver:self forKeyPath:@"recalculating" options:0 context:&self->m_listOfItems];
    
    NSString *str = [[NSString alloc] init];
    str = @"test";
    CoursePK *pk1 = [[CoursePK alloc] initWithCode:@"pk1"];
    CoursePK *pk2 = [[CoursePK alloc] initWithCode:@"pk2"];
    
    NSString *tmp = [pk1 courseCode];
    BOOL b = [pk1 isEqual:pk2];
    b = NO;
    
    Course *course = [[Course alloc] initWithCoursePK:pk1];
    tmp = [course title];
    CoursePK *pk3 = [course coursePK];
    b = [pk3 isEqual:pk1];
}

/*- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
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
    return [m_listOfItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	NSString *cellValue = [m_listOfItems objectAtIndex:indexPath.row];
	cell.text = cellValue;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:Y	ES];
     [detailViewController release];
     */
}

- (void)addCourse
{
    [m_listOfItems addObject:@"addCourse"];
    NSLog(@"Add course button was clicked");
    
    [self.tableView reloadData];
}

@end
