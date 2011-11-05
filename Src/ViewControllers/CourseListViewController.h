//
//  CourseListViewController.h
//  CourseManagement
//
//  Created by raycad on 10/23/11.
//  Copyright 2011 seedotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseModel.h"

@interface CourseViewCell : UITableViewCell {
    UILabel     *m_titleLabel;
    UILabel     *m_categoryLabel;
    UIImageView *m_thumbnailImageView;
    
    Course      *m_course;
}
@property (nonatomic, retain) UILabel     *titleLabel;
@property (nonatomic, retain) UILabel     *categoryLabel;
@property (nonatomic, retain) UIImageView *thumbnailImageView;
@property (nonatomic, retain) Course      *course;
@end

@interface CourseListViewController : UIViewController {
    CourseModel *m_courseModel;    
    UITableView *m_courseTableView;
    UISearchBar *m_searchBar;
}
@property (nonatomic, retain) IBOutlet UITableView *courseTableView;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;

@end
