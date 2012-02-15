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
#import "SdtViewController.h"

@interface CourseViewController : SdtViewController {
    UITextField                         *m_titleTextField;
    UITextView                          *m_descriptionTextView;
    UITextField                         *m_categoryTextField;       
    Course                              *m_course;
    UIButton                            *m_addStudentButton;
    UISearchBar                         *m_searchBar;
    UITableView                         *m_studentTableView;
    StudentModel                        *m_studentModel;        // selected students model
    StudentModel                        *m_filterStudentModel;  // filter students model
}

@property (nonatomic, retain) IBOutlet UITextField  *titleTextField;
@property (nonatomic, retain) IBOutlet UITextField  *categoryTextField;
@property (nonatomic, retain) IBOutlet UITextView   *descriptionTextView;
@property (nonatomic, retain) IBOutlet UIButton     *addStudentButton;
@property (nonatomic, retain) IBOutlet UISearchBar  *searchBar;
@property (nonatomic, retain) IBOutlet UITableView  *studentTableView;
@property (nonatomic, retain)Course                 *course;
@property (nonatomic, retain) StudentModel          *studentModel;

- (void) refreshData;

- (IBAction)addStudent:(id)sender;
@end