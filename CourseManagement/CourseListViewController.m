//
//  CourseListViewController.m
//  CourseManagement
//
//  Created by raycad on 10/23/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "CourseListViewController.h"
#import "Course.h"
#import "CourseViewController.h"
#import "Common.h"

@implementation CourseViewCell

@synthesize titleLabel = m_titleLabel;
@synthesize categoryLabel = m_categoryLabel;
@synthesize thumbnailImageView = m_thumbnailImageView;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
    if ((self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier])) {
        // Initialization code
        m_titleLabel = [[UILabel alloc]init];
        m_titleLabel.textAlignment = UITextAlignmentLeft;
        m_titleLabel.font = [UIFont systemFontOfSize:15];
        m_categoryLabel = [[UILabel alloc]init];
        m_categoryLabel.textAlignment = UITextAlignmentLeft;
        //m_categoryLabel.font = [UIFont systemFontOfSize:10];
        m_categoryLabel.font = [UIFont fontWithMarkupDescription:@"font-family: Arial; font-size: 11px; font-weight: bold; font-style : italic;"];
        m_categoryLabel.textColor = [UIColor orangeColor];
        m_thumbnailImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:m_titleLabel];
        [self.contentView addSubview:m_categoryLabel];
        [self.contentView addSubview:m_thumbnailImageView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame = CGRectMake(boundsX+10 ,0, 50, 50);
    m_thumbnailImageView.frame = frame;
    
    frame = CGRectMake(boundsX+70 ,5, 200, 25);
    m_titleLabel.frame = frame;
    
    frame = CGRectMake(boundsX+70 ,32, 100, 15);
    m_categoryLabel.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)dealloc
{
    [m_titleLabel release];
    [m_categoryLabel release];
    [m_thumbnailImageView release];
}
@end

@implementation CourseListViewController

- (id)init
{
    //self = [super initWithStyle:UITableViewStyleGrouped];
    self = [super init];
    if (self != nil) {
        // Initialize the course model
        m_courseModel = [CourseModel instance];

        // Set up our navigation bar.
        self.title = CourseListViewTitle;        
        self.tabBarItem.image = [UIImage imageNamed:@"course.png"];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(removeCourse)];
        
        /*self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Options" style:UIBarButtonItemStyleBordered target:self action:@selector(optionsAction:)        ] autorelease];*/
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCourse)];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;//[indexPath row] * 20;
}

- (void)dealloc
{
    [m_courseModel release];
    
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
    
    //self.tableView.editing = YES;
    //self.tableView.allowsSelectionDuringEditing = YES;
    
    // Add courses
    for (int i = 0; i < 3; i++) {     
        NSString *title = [NSString stringWithFormat:@"IOS %d", i];
        CoursePK *coursePK = [[CoursePK alloc] initWithCourseTitle:title];
        Course *course = [[Course alloc] initWithCoursePK:coursePK];
        [course setTitle:title];
        [course setCategory:@"IOS"];
        [course setDescription:@"Course for developing IOS skill"];
                
        if ([m_courseModel addCourse:course]) {
            NSLog(@"Added sucessfully");
        }
        
        [coursePK release];
        [course release];    
    }
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
    return [m_courseModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CourseViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[CourseViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
    Course *course = [m_courseModel courseAtIndex:indexPath.row];
    if (!course)
        return nil;
	
    // Set up the cell…
    cell.titleLabel.text = [course title];
    cell.categoryLabel.text = [course category];
    cell.thumbnailImageView.image = [UIImage imageNamed:@"Xcode-48.png"];
    
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
    [self presentCourseViewModally];
    
    /*
    // Create a new one
    CoursePK *coursePK = [[CoursePK alloc] initWithCode:[NSString stringWithFormat:@"IOS %d", [m_courseModel count]]];
    Course *course = [[Course alloc] initWithCoursePK:coursePK];
    [course setTitle:[NSString stringWithFormat:@"IOS Course %d", [m_courseModel count]]];
    [course setDescription:@"Course for developing IOS skill"];

    
    if ([m_courseModel addCourse:course]) {
        [self.tableView reloadData];
        
        NSLog(@"Add course button was clicked");
    }
     */
}

- (void)removeCourse 
{
    // Get selected row
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    if ([m_courseModel removeCourseByIndex:selectedIndexPath.row]) {
        [self.tableView reloadData];
        
        NSLog(@"Remove course button was clicked");
    }
}

- (void)presentCourseViewModally
// Displays the options view so that the user can add a new number to the 
// list of numbers to add up.
{
    CourseViewController * vc;
    
    vc = [[[CourseViewController alloc] init] autorelease];
    assert(vc != nil);
    
    vc.delegate = self;
    
    [vc presentModallyOn:self];
}

- (void)didSaveCourse:(CourseViewController *)controller
// Called when the user taps Save in the options view.  The options 
// view has already saved the options, so we have nothing to do other 
// than to tear down the view.
{
#pragma unused(controller)
    assert(controller != nil);
    
    NSString *title = [controller.titleTextField text];
    
    if ([title isEqualToString:@""]) {
        // Open a alert with an OK button
        NSString *alertString = [NSString stringWithFormat:@"Title must not be empty"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        return;
    }

    NSString *category = [controller.categoryTextField text];
    NSString *description = [controller.descriptionTextView text];
    if (title == @"")
        return;
    
    CoursePK *coursePK = [[CoursePK alloc] initWithCourseTitle:title];
    Course *course = [[Course alloc] initWithCoursePK:coursePK];
    [course setTitle:title];
    [course setCategory:category];
    [course setDescription:description];
    
    if (![m_courseModel addCourse:course]) {
        // Open a alert with an OK button
        NSString *alertString = [NSString stringWithFormat:@"The course is existing"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        return;
    }
        
    [self dismissModalViewControllerAnimated:YES];
    [self.tableView reloadData];
}

- (void)didCancelCourse:(CourseViewController *)controller
// Called when the user taps Cancel in the options view.
{
#pragma unused(controller)
    assert(controller != nil);
    [self dismissModalViewControllerAnimated:YES];
}

@end
