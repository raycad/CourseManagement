//
//  StudentListViewController.h
//  CourseManagement
//
//  Created by raycad on 10/31/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentModel.h"
#import "Student.h"
#import "CMModel.h"

@interface StudentListViewController : UIViewController {
    StudentModel    *m_studentModel;    
    UISearchBar     *m_searchBar;
    UITableView     *m_studentTableView;
    
    CMModel         *m_cmModel; // Singleton CourseManagement model
}

@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet UITableView *studentTableView;

- (void) refreshData;
@end