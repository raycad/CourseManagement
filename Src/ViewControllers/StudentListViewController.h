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

@interface StudentViewCell : UITableViewCell {
    UILabel *m_fullNameLabel;
    UILabel *m_idNumberLabel;
    UIImageView *m_thumbnailImageView;
    Student *m_student;
}

@property(nonatomic, retain)UILabel *fullNameLabel;
@property(nonatomic, retain)UILabel *idNumberLabel;
@property(nonatomic, retain)UIImageView *thumbnailImageView;
@property(nonatomic, retain)Student *student;

@end

@interface StudentListViewController : UIViewController {
    StudentModel *m_studentModel;    
    UISearchBar *m_searchBar;
    UITableView *m_studentTableView;
}

@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet UITableView *studentTableView;

@end