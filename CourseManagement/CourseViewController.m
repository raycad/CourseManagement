//
//  CourseViewController.m
//  CourseManagement
//
//  Created by raycad on 10/29/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import "CourseViewController.h"

@implementation CourseViewController

@synthesize titleTextField = m_titleTextField;
@synthesize categoryTextField = m_categoryTextField;
@synthesize thumbnailImageButton = m_thumbnailImageButton;
@synthesize descriptionTextView = m_descriptionTextView;
@synthesize delegate = m_delegate;

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
    [m_thumbnailImageButton release];
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
    // Set default parameters
    UIImage *thumbnailImage = [UIImage imageNamed:@"Xcode-48.png"];
    [m_thumbnailImageButton setImage:thumbnailImage forState:UIControlStateNormal];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTitleTextField:nil];
    [self setDescriptionTextView:nil];
    [self setCategoryTextField:nil];
    [self setThumbnailImageButton:nil];
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
