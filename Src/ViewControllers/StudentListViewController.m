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

@implementation StudentViewCell

@synthesize fullNameLabel = m_fullNameLabel;
@synthesize idNumberLabel = m_idNumberLabel;
@synthesize thumbnailImageView = m_thumbnailImageView;
@synthesize student = m_student;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
    if ((self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier])) {
        // Initialization code
        m_fullNameLabel = [[UILabel alloc]init];
        m_fullNameLabel.textAlignment = UITextAlignmentLeft;
        m_fullNameLabel.font = [UIFont systemFontOfSize:15];
        m_idNumberLabel = [[UILabel alloc]init];
        m_idNumberLabel.textAlignment = UITextAlignmentLeft;
        //m_categoryLabel.font = [UIFont systemFontOfSize:10];
        m_idNumberLabel.font = [UIFont fontWithMarkupDescription:@"font-family: Arial; font-size: 11px; font-weight: bold; font-style : italic;"];
        m_idNumberLabel.textColor = [UIColor orangeColor];
        m_thumbnailImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:m_fullNameLabel];
        [self.contentView addSubview:m_idNumberLabel];
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
    m_fullNameLabel.frame = frame;
    
    frame = CGRectMake(boundsX+70 ,32, 100, 15);
    m_idNumberLabel.frame = frame;
}

- (void)dealloc
{
    [m_fullNameLabel release];
    [m_idNumberLabel release];
    [m_thumbnailImageView release];
    [m_student release];
}
@end

@implementation StudentListViewController

@synthesize searchBar = m_searchBar;
@synthesize studentTableView = m_studentTableView;

- (void)createDefaultData
{
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
    if ([m_studentModel addStudent:student]) {
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
    if ([m_studentModel addStudent:student]) {
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
    if ([m_studentModel addStudent:student]) {
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
    if ([m_studentModel addStudent:student]) {
        NSLog(@"Added sucessfully");
    }
    [idNumber release];
    [personPK release];
    [student release];  
}

- (id)init
{
    //self = [super initWithStyle:UITableViewStyleGrouped];
    self = [super init];
    if (self != nil) {
        // Initialize the course model
        m_studentModel = [StudentModel instance];
        
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
    
	[self createDefaultData];
    
    // Reload data
    [self.studentTableView reloadData];
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
    [self.studentTableView reloadData];
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
        cell.thumbnailImageView.image = [UIImage imageNamed:@"student_male.png"];
    else
        cell.thumbnailImageView.image = [UIImage imageNamed:@"student_female.png"];
    
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
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if ([m_studentModel removeStudentByIndex:indexPath.row]) {
            //[self.tableView reloadData];
            
            [self.studentTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
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
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // only show the status bar’s cancel button while in edit mode
    m_searchBar.showsCancelButton = YES;
    m_searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    // flush the previous search content
    [m_studentTableView reloadData];
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
    //[m_studentTableView removeAllObjects];
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
