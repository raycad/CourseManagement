//
//  CourseViewController.h
//  CourseManagement
//
//  Created by raycad on 10/29/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "StudentModel.h"
#import "Student.h"
#import "CMModel.h"

@protocol CourseViewControllerDelegate;
@interface CourseViewController : UIViewController {
    id<CourseViewControllerDelegate>    m_delegate;
    UITextField                         *m_titleTextField;
    UITextView                          *m_descriptionTextView;
    UITextField                         *m_categoryTextField;       
    Course                              *m_course;
    UIButton                            *m_addStudentButton;
    UISearchBar                         *m_searchBar;
    UITableView                         *m_studentTableView;
    
    StudentModel                        *m_studentModel; // filter student model
}

@property (nonatomic, retain) IBOutlet UITextField  *titleTextField;
@property (nonatomic, retain) IBOutlet UITextField  *categoryTextField;
@property (nonatomic, retain) IBOutlet UITextView   *descriptionTextView;
@property (nonatomic, retain) IBOutlet UIButton     *addStudentButton;
@property (nonatomic, retain) IBOutlet UISearchBar  *searchBar;
@property (nonatomic, retain) IBOutlet UITableView  *studentTableView;
@property (nonatomic, retain)Course                 *course;
@property (nonatomic, assign, readwrite)id<CourseViewControllerDelegate> delegate;

- (void) refreshData;

- (IBAction)addStudent:(id)sender;

- (void)presentModallyOn:(UIViewController *)parent;

- (IBAction)selectImage:(id)sender;
@end

@protocol CourseViewControllerDelegate <NSObject>
@required
- (void)didSaveCourse:(CourseViewController *)controller;
- (void)didCancelCourse:(CourseViewController *)controller;
@end
